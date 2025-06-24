
<%-- BarraNavegacion.jsp --%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

<style>
:root {
    --primary-color: #2563EB;
    --secondary-color: #3B82F6;
    --accent-color: #60A5FA;
    --accent2-color: #1D4ED8;
    --text-color: #1E293B;
    --background-light: #F8FAFC;
}

.navbar-container {
    position: fixed;
    top: 20px;
    left: 20px;
    z-index: 1000;
    font-family: 'Nunito', sans-serif;
}

.hamburger-btn {
    width: 50px;
    height: 50px;
    background: var(--primary-color);
    border: none;
    border-radius: 15px;
    cursor: pointer;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    gap: 5px;
    box-shadow: 0 4px 15px rgba(255, 158, 0, 0.3);
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.hamburger-btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(45deg, var(--accent-color), var(--accent2-color));
    opacity: 0;
    transition: opacity 0.3s ease;
    border-radius: 15px;
}

.hamburger-btn:hover::before {
    opacity: 1;
}

.hamburger-btn:hover {
    transform: scale(1.1);
    box-shadow: 0 6px 20px rgba(37, 99, 235, 0.4);
}

.hamburger-line {
    width: 25px;
    height: 3px;
    background: white;
    border-radius: 2px;
    transition: all 0.3s ease;
    position: relative;
    z-index: 1;
}

.hamburger-btn.active .hamburger-line:nth-child(1) {
    transform: rotate(45deg) translate(8px, 8px);
}

.hamburger-btn.active .hamburger-line:nth-child(2) {
    opacity: 0;
}

.hamburger-btn.active .hamburger-line:nth-child(3) {
    transform: rotate(-45deg) translate(7px, -6px);
}

.nav-menu {
    position: absolute;
    top: 60px;
    left: 0;
    background: white;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    opacity: 0;
    visibility: hidden;
    transform: translateY(-20px) scale(0.95);
    transition: all 0.3s ease;
    min-width: 200px;
    overflow: hidden;
    border: 3px solid var(--accent-color);
    z-index: 1001;
}

.nav-menu.active {
    opacity: 1;
    visibility: visible;
    transform: translateY(0) scale(1);
    animation: fadeInDown 0.3s ease;
}

.nav-item {
    display: flex;
    align-items: center;
    padding: 15px 20px;
    color: var(--text-color);
    text-decoration: none;
    font-weight: 600;
    font-size: 1rem;
    transition: all 0.3s ease;
    border-bottom: 1px solid #f0f0f0;
    position: relative;
    overflow: hidden;
    cursor: pointer;
}

.nav-item:last-child {
    border-bottom: none;
}

.nav-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, var(--secondary-color), var(--accent-color));
    transition: left 0.3s ease;
    z-index: -1;
}

.nav-item:hover::before {
    left: 0;
}

.nav-item:hover {
    color: white;
    transform: translateX(5px);
}

.nav-item i {
    margin-right: 10px;
    width: 20px;
    text-align: center;
    color: var(--primary-color);
    transition: all 0.3s ease;
}

.nav-item:hover i {
    color: white;
    transform: scale(1.2);
}

.nav-overlay {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.1);
    opacity: 0;
    visibility: hidden;
    transition: all 0.3s ease;
    z-index: 999;
}

.nav-overlay.active {
    opacity: 1;
    visibility: visible;
}

@media (max-width: 768px) {
    .navbar-container {
        top: 15px;
        left: 15px;
    }

    .hamburger-btn {
        width: 45px;
        height: 45px;
    }

    .hamburger-line {
        width: 20px;
        height: 2px;
    }

    .nav-menu {
        min-width: 180px;
        top: 55px;
    }

    .nav-item {
        padding: 12px 15px;
        font-size: 0.9rem;
    }
}

@media (max-width: 480px) {
    .navbar-container {
        top: 10px;
        left: 10px;
    }

    .hamburger-btn {
        width: 40px;
        height: 40px;
    }

    .nav-menu {
        min-width: 160px;
        top: 50px;
    }
}

@keyframes fadeInDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

<!-- HTML de la barra -->
<div class="navbar-container">
    <div class="nav-overlay" id="navOverlay_unique"></div>

    <button class="hamburger-btn" id="hamburgerBtn_unique" aria-label="Menú de navegación">
        <span class="hamburger-line"></span>
        <span class="hamburger-line"></span>
        <span class="hamburger-line"></span>
    </button>

    <nav class="nav-menu" id="navMenu_unique">
        <a href="<%= request.getContextPath() %>/Sistema/menu.jsp" class="nav-item" data-nav-link><i class="fas fa-home"></i> Home</a>
        <a href="<%= request.getContextPath() %>/Espanol/P-Espanol.jsp" class="nav-item" data-nav-link><i class="fas fa-language"></i> Español</a>
        <a href="<%= request.getContextPath() %>/Mates/P-Mates.jsp" class="nav-item" data-nav-link><i class="fas fa-calculator"></i> Matemáticas</a>
        <a href="<%= request.getContextPath() %>/Ingles/P-Ingles.jsp" class="nav-item" data-nav-link><i class="fas fa-globe"></i> Inglés</a>
        <a href="<%= request.getContextPath() %>/Actividades/P-Pruebas.jsp" class="nav-item" data-nav-link><i class="fas fa-graduation-cap"></i> Pruebas</a>
        <a href="<%= request.getContextPath() %>/Progreso/P-graficos.jsp" class="nav-item" data-nav-link><i class="fas fa-chart-pie"></i> Mis gráficos</a>
        <a href="<%= request.getContextPath() %>/Ajustes/P-perfil.jsp" class="nav-item" data-nav-link><i class="fas fa-user"></i> Perfil</a>
        <a href="<%= request.getContextPath() %>/Sistema/invalidateSession.jsp" class="nav-item" data-nav-link><i class="fas fa-sign-out-alt"></i> Cerrar sesión</a>
    </nav>
</div>


<!-- ? SCRIPT CORREGIDO -->
<script>
window.NavbarController = window.NavbarController || (function() {
    let isInitialized = false;

    function initializeNavbar() {
        if (isInitialized) return;

        const hamburgerBtn = document.getElementById('hamburgerBtn_unique');
        const navMenu = document.getElementById('navMenu_unique');
        const navOverlay = document.getElementById('navOverlay_unique');

        if (!hamburgerBtn || !navMenu || !navOverlay) {
            console.warn('Elementos de navegación no encontrados');
            return;
        }

        function toggleMenu() {
            hamburgerBtn.classList.toggle('active');
            navMenu.classList.toggle('active');
            navOverlay.classList.toggle('active');
        }

        function closeMenu() {
            hamburgerBtn.classList.remove('active');
            navMenu.classList.remove('active');
            navOverlay.classList.remove('active');
        }

        hamburgerBtn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            toggleMenu();
        });

        navOverlay.addEventListener('click', function(e) {
            e.preventDefault();
            closeMenu();
        });

        // ? Corregido: dejamos que el <a> se comporte normalmente
        const navItems = document.querySelectorAll('[data-nav-link]');
        navItems.forEach(item => {
            item.addEventListener('click', function() {
                closeMenu();
                // no hacemos redirección manual
            });
        });

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape' && navMenu.classList.contains('active')) {
                closeMenu();
            }
        });

        navMenu.addEventListener('click', function(e) {
            e.stopPropagation();
        });

        document.addEventListener('click', function(e) {
            if (!hamburgerBtn.contains(e.target) && !navMenu.contains(e.target)) {
                closeMenu();
            }
        });

        isInitialized = true;
        console.log('Navbar inicializada correctamente');
    }

    function reinitialize() {
        isInitialized = false;
        initializeNavbar();
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initializeNavbar);
    } else {
        initializeNavbar();
    }

    return {
        reinitialize: reinitialize
    };
})();
</script>
