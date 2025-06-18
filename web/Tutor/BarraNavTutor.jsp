<%-- 
    Document   : BarraNavTutor
    Created on : 14 abr. 2025, 18:24:39
    Author     : P500
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Barra de Navegación - KIDI</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <script>
                    
        </script>
        
        <!-- Código de instalación Cliengo para diego.alberto.luna.martinez@gmail.com -->
<script type="text/javascript">
  (function () {
    var ldk = document.createElement('script');
    ldk.type = 'text/javascript';
    ldk.async = true;
    ldk.src = 'https://s.cliengo.com/weboptimizer/67f86cf651e42e6ec120582b/67f86cf651e42e6ec120582e.js?platform=onboarding_modular';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ldk, s);
  })();
</script>
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
                margin-left: 100px; /* Wider collapsed width */
            }

            .sidebar {
                height: 100vh;
                width: 100px; /* Wider collapsed width */
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
                width:280px; /* Slightly wider expanded width */
            }

            .sidebar-logo {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 80px;
                border-bottom: 1px solid rgba(0,0,0,0.1);
                visibility: hidden;
            }

            .sidebar-logo img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                transition: transform var(--transition-speed) ease;
            }

            .sidebar.expanded .sidebar-logo img {
                transform: rotate(360deg);
                visibility: visible;
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
        </style>
    </head>
    <body>
        <nav class="sidebar" id="sidebar">
            <button class="sidebar-toggle" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </button>
            <div class="sidebar-logo">
                <img src="../img/logito.png" alt="KIDI Logo">
            </div>
            <ul class="nav-list">
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-home"></i>
                        <span>Home</span>
                    </a>
                    <div class="submenu">
                        <a href="menu_T.jsp" class="nav-link">
                            <i class="fas fa-bell"></i>
                            <span>Novedades</span>
                        </a>
                    </div>
                </li>               
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-child"></i>
                        <span>Gestión de niños</span>
                    </a>
                    <div class="submenu">
                        <a href="P-VerNiños.jsp" class="nav-link">
                            <i class="fas fa-eye"></i>
                            <span>Mis niños</span>
                        </a>
                        <a href="P-AnadirN.jsp" class="nav-link">
                            <i class="fas fa-user-plus"></i>
                            <span>Añadir niño</span>
                        </a>
                        <a href="P-EliminarN.jsp" class="nav-link">
                            <i class="fas fa-user-minus"></i>
                            <span>Eliminar niño</span>
                        </a>                        
                    </div>
                    
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-chart-line"></i>
                        <span>Progreso académico</span>
                    </a>
                    <div class="submenu">
                        <a href="P-graficosT.jsp" class="nav-link">
                            <i class="fas fa-file-alt"></i>
                            <span>Informe de progreso</span>
                        </a>                        
                    </div>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">
                        <i class="fas fa-cog"></i>
                        <span>Ajustes</span>
                    </a>
                    <div class="submenu">
                        <a href="P-perfilT.jsp" class="nav-link">
                            <i class="fas fa-user-circle"></i>
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
                const navItems = document.querySelectorAll('.nav-item');

                sidebarToggle.addEventListener('click', () => {
                    sidebar.classList.toggle('expanded');
                });

                navItems.forEach(item => {
                    const mainLink = item.querySelector('.nav-link');
                    const submenu = item.querySelector('.submenu');

                    mainLink.addEventListener('click', (e) => {
                        e.preventDefault();
                        submenu.classList.toggle('show');
                    });
                });
            });
        </script>
    </body>
</html>
