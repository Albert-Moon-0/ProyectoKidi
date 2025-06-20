<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Barra de Navegaci�n - KIDI</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
        <script>
            /*
            (function (w, d, s, o, f, js, fjs) {
                w["botsonic_widget"] = o;
                w[o] =
                        w[o] ||
                        function () {
                            (w[o].q = w[o].q || []).push(arguments);
                        };
                (js = d.createElement(s)), (fjs = d.getElementsByTagName(s)[0]);
                js.id = o;
                js.src = f;
                js.async = 1;
                fjs.parentNode.insertBefore(js, fjs);
            })(window, document, "script", "Botsonic", "https://widget.botsonic.com/CDN/botsonic.min.js");
            Botsonic("init", {
                serviceBaseUrl: "https://api-azure.botsonic.ai",
                token: "e15fef38-59de-42e9-9fff-08aa6687bbc9",
            });
             */
            
        </script>
        
        <!-- C�digo de instalaci�n Cliengo para diego.alberto.luna.martinez@gmail.com -->
        <script type="text/javascript">
            /*
  (function () {
    var ldk = document.createElement('script');
    ldk.type = 'text/javascript';
    ldk.async = true;
    ldk.src = 'https://s.cliengo.com/weboptimizer/67f86cf651e42e6ec120582b/67f86cf651e42e6ec120582e.js?platform=onboarding_modular';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ldk, s);
  })();     
             */
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
                            <span>Espa�ol</span>
                        </a>
                        <a href="../Mates/P-Mates.jsp" class="nav-link">
                            <i class="fas fa-calculator"></i>
                            <span>Matem�ticas</span>
                        </a>
                        <a href="../Ingles/P-Ingles.jsp" class="nav-link">
                            <i class="fas fa-globe"></i>
                            <span>Ingl�s</span>
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
                            <span>Mis gr�ficos de logro</span>
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
                            <span>Cerrar sesi�n</span>
                        </a>
                    </div>
                </li>
            </ul>

            <div class="sidebar-footer">
                <span>� KIDI 2025</span>
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