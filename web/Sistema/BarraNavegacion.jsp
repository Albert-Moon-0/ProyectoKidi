<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Barra de Navegación - KIDI</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <style>
            :root {
                --primary-color: #3B7DDD;
                --secondary-color: #E5F0FA;
                --text-color: #555;
                --hover-color: #C4E3FE;
                --transition-speed: 0.3s;
            }

            body {
                font-family: 'Poppins', sans-serif;
                transition: margin-left var(--transition-speed) ease;
                margin-left: 100px;
            }

            /* Desktop Sidebar */
            .sidebar {
                height: 100vh;
                width: 100px;
                position: fixed;
                top: 0;
                left: 0;
                background-color: var(--secondary-color);
                transition: width var(--transition-speed) ease;
                overflow-x: hidden;
                z-index: 1000;
                display: flex;
                flex-direction: column;
            }

            .sidebar.expanded {
                width: 280px;
            }

            .sidebar-logo {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 80px;
                border-bottom: 1px solid rgba(0,0,0,0.1);
            }

            .sidebar-logo img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                transition: transform var(--transition-speed) ease;
            }

            .sidebar.expanded .sidebar-logo img {
                transform: rotate(360deg);
            }

            .sidebar-toggle {
                position: absolute;
                top: 20px;
                right: 10px;
                background: none;
                border: none;
                color: var(--primary-color);
                font-size: 1.5rem;
                cursor: pointer;
                z-index: 1001;
                transition: transform var(--transition-speed) ease;
            }

            .sidebar.expanded .sidebar-toggle {
                transform: rotate(180deg);
            }

            .nav-list {
                list-style: none;
                padding: 0;
                flex-grow: 1;
                overflow-y: auto;
            }

            .nav-item {
                position: relative;
            }

            .nav-link {
                display: flex;
                align-items: center;
                padding: 12px 20px;
                color: var(--text-color);
                text-decoration: none;
                transition: all var(--transition-speed) ease;
            }

            .nav-link i {
                margin-right: 15px;
                min-width: 25px;
                text-align: center;
                color: var(--primary-color);
            }

            .nav-link span {
                opacity: 0;
                width: 0;
                overflow: hidden;
                transition: opacity var(--transition-speed) ease, width var(--transition-speed) ease;
                white-space: nowrap;
            }

            .sidebar.expanded .nav-link span {
                opacity: 1;
                width: auto;
            }

            .nav-link:hover {
                background-color: var(--hover-color);
            }

            .nav-link.active {
                background-color: rgba(59, 125, 221, 0.1);
                color: var(--primary-color);
            }

            .sidebar-footer {
                padding: 15px;
                text-align: center;
                border-top: 1px solid rgba(0,0,0,0.1);
            }

            .sidebar-footer span {
                opacity: 0;
                width: 0;
                overflow: hidden;
                transition: opacity var(--transition-speed) ease, width var(--transition-speed) ease;
            }

            .sidebar.expanded .sidebar-footer span {
                opacity: 1;
                width: auto;
            }

            /* Submenu styles */
            .submenu {
                max-height: 0;
                overflow: hidden;
                transition: max-height var(--transition-speed) ease;
                background-color: rgba(255,255,255,0.5);
            }

            .submenu.show {
                max-height: 300px;
            }

            .submenu a {
                padding-left: 50px;
                font-size: 0.9rem;
            }

            /* Mobile Navigation Overlay */
            .mobile-overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 999;
                opacity: 0;
                transition: opacity var(--transition-speed) ease;
            }

            .mobile-overlay.show {
                opacity: 1;
            }

            /* Mobile Hamburger Button */
            .mobile-menu-btn {
                display: none;
                position: fixed;
                top: 15px;
                left: 15px;
                background: var(--primary-color);
                color: white;
                border: none;
                border-radius: 8px;
                width: 50px;
                height: 50px;
                font-size: 1.2rem;
                z-index: 1002;
                box-shadow: 0 4px 12px rgba(59, 125, 221, 0.3);
                transition: all var(--transition-speed) ease;
            }

            .mobile-menu-btn:hover {
                background: #2c5aa0;
                transform: scale(1.05);
            }

            /* Mobile Responsive Styles */
            @media (max-width: 768px) {
                body {
                    margin-left: 0;
                }

                .mobile-menu-btn {
                    display: block;
                }

                .mobile-overlay {
                    display: block;
                }

                .sidebar {
                    transform: translateX(-100%);
                    width: 280px;
                    transition: transform var(--transition-speed) ease;
                }

                .sidebar.mobile-open {
                    transform: translateX(0);
                }

                .sidebar-toggle {
                    display: none;
                }

                .sidebar-logo {
                    visibility: visible;
                }

                .nav-link span {
                    opacity: 1;
                    width: auto;
                }

                .sidebar-footer span {
                    opacity: 1;
                    width: auto;
                }

                /* Mobile submenu adjustments */
                .submenu a {
                    padding-left: 40px;
                }
            }

            /* Tablet adjustments */
            @media (max-width: 1024px) and (min-width: 769px) {
                body {
                    margin-left: 80px;
                }

                .sidebar {
                    width: 80px;
                }

                .sidebar.expanded {
                    width: 250px;
                }
            }

            /* Animation for mobile menu icon */
            .mobile-menu-btn .fa-bars {
                transition: transform var(--transition-speed) ease;
            }

            .mobile-menu-btn.active .fa-bars {
                transform: rotate(90deg);
            }
        </style>
    </head>
    <body>
        <!-- Mobile Menu Button -->
        <button class="mobile-menu-btn" id="mobileMenuBtn">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Mobile Overlay -->
        <div class="mobile-overlay" id="mobileOverlay"></div>

        <nav class="sidebar" id="sidebar">
            <button class="sidebar-toggle" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </button>

            <div class="sidebar-logo">
                <img src="../img/logito.png" alt="KIDI Logo">
            </div>

            <ul class="nav-list">
                <li class="nav-item">
                    <a href="../Sistema/menu.jsp" class="nav-link">
                        <i class="fas fa-home"></i>
                        <span>Home</span>
                    </a>
                    <div class="submenu">
                        <a href="../Sistema/menu.jsp#novedades" class="nav-link">
                            <i class="fas fa-newspaper"></i>
                            <span>Novedades</span>
                        </a>
                    </div>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-book"></i>
                        <span>Materias</span>
                    </a>
                    <div class="submenu">
                        <a href="../Espanol/P-Espanol.jsp" class="nav-link">
                            <i class="fas fa-language"></i>
                            <span>Español</span>
                        </a>
                        <a href="../Mates/P-Mates.jsp" class="nav-link">
                            <i class="fas fa-calculator"></i>
                            <span>Matemáticas</span>
                        </a>
                        <a href="../Ingles/P-Ingles.jsp" class="nav-link">
                            <i class="fas fa-globe"></i>
                            <span>Inglés</span>
                        </a>
                    </div>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-tasks"></i>
                        <span>Actividades</span>
                    </a>
                    <div class="submenu">
                        <a href="../Actividades/P-Pruebas.jsp" class="nav-link">
                            <i class="fas fa-graduation-cap"></i>
                            <span>Pruebas de conocimiento</span>
                        </a>
                    </div>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-chart-line"></i>
                        <span>Progreso</span>
                    </a>
                    <div class="submenu">                       
                        <a href="../Progreso/P-graficos.jsp" class="nav-link">
                            <i class="fas fa-chart-pie"></i>
                            <span>Mis gráficos de logro</span>
                        </a>     
                    </div>
                </li>

                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-cog"></i>
                        <span>Ajustes</span>
                    </a>
                    <div class="submenu">
                        <a href="../Ajustes/P-perfil.jsp" class="nav-link">
                            <i class="fas fa-user"></i>
                            <span>Perfil</span>
                        </a>                        
                        <a href="../Sistema/invalidateSession.jsp" class="nav-link">
                            <i class="fas fa-sign-out-alt"></i>
                            <span>Cerrar sesión</span>
                        </a>
                    </div>
                </li>
            </ul>

            <div class="sidebar-footer">
                <span>© KIDI 2025</span>
            </div>
        </nav>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const sidebar = document.getElementById('sidebar');
                const sidebarToggle = document.getElementById('sidebarToggle');
                const mobileMenuBtn = document.getElementById('mobileMenuBtn');
                const mobileOverlay = document.getElementById('mobileOverlay');
                const navItems = document.querySelectorAll('.nav-item');

                // Desktop sidebar toggle
                sidebarToggle.addEventListener('click', () => {
                    sidebar.classList.toggle('expanded');
                });

                // Mobile menu functionality
                function toggleMobileMenu() {
                    sidebar.classList.toggle('mobile-open');
                    mobileOverlay.classList.toggle('show');
                    mobileMenuBtn.classList.toggle('active');
                }

                mobileMenuBtn.addEventListener('click', toggleMobileMenu);
                mobileOverlay.addEventListener('click', toggleMobileMenu);

                // Submenu functionality
                navItems.forEach(item => {
                    const mainLink = item.querySelector('.nav-link');
                    const submenu = item.querySelector('.submenu');

                    if (submenu) {
                        mainLink.addEventListener('click', (e) => {
                            e.preventDefault();
                            
                            // Close other submenus
                            navItems.forEach(otherItem => {
                                if (otherItem !== item) {
                                    const otherSubmenu = otherItem.querySelector('.submenu');
                                    if (otherSubmenu) {
                                        otherSubmenu.classList.remove('show');
                                    }
                                }
                            });
                            
                            // Toggle current submenu
                            submenu.classList.toggle('show');
                        });
                    }
                });

                // Close mobile menu when clicking on a submenu link
                document.querySelectorAll('.submenu .nav-link').forEach(link => {
                    link.addEventListener('click', () => {
                        if (window.innerWidth <= 768) {
                            toggleMobileMenu();
                        }
                    });
                });

                // Handle window resize
                window.addEventListener('resize', () => {
                    if (window.innerWidth > 768) {
                        sidebar.classList.remove('mobile-open');
                        mobileOverlay.classList.remove('show');
                        mobileMenuBtn.classList.remove('active');
                    }
                });
            });
        </script>
    </body>
</html>