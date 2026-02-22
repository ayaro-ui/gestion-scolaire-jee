<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un étudiant - EduManager</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #1E40AF;
            --primary-light: #2563EB;
            --accent: #3B82F6;
            --accent-hover: #2563EB;
            --success: #10B981;
            --text-primary: #0F172A;
            --text-secondary: #64748B;
            --text-muted: #94A3B8;
            --bg-main: #F8FAFC;
            --bg-card: #FFFFFF;
            --border: #E2E8F0;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
            --shadow-xl: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--bg-main);
            color: var(--text-primary);
            line-height: 1.6;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        /* Sidebar Design System */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 280px;
            height: 100vh;
            background: var(--primary);
            color: white;
            padding: 0;
            box-shadow: var(--shadow-xl);
            z-index: 1000;
            transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .sidebar-header {
            padding: 32px 24px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 8px;
        }

        .logo-icon {
            width: 40px;
            height: 40px;
            background: var(--accent);
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: 700;
        }

        .logo h1 {
            font-family: 'Outfit', sans-serif;
            font-size: 22px;
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        .logo-tagline {
            font-size: 13px;
            color: var(--text-muted);
            font-weight: 400;
            padding-left: 52px;
        }

        .sidebar-menu {
            list-style: none;
            padding: 24px 16px;
        }

        .sidebar-menu li {
            margin-bottom: 4px;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 12px 16px;
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.2s ease;
            gap: 12px;
        }

        .sidebar-menu a:hover {
            background: rgba(255, 255, 255, 0.08);
            color: white;
        }

        .sidebar-menu a.active {
            background: var(--accent);
            color: white;
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.4);
        }

        .menu-icon {
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Mobile Toggle */
        .sidebar-toggle {
            display: none;
            position: fixed;
            top: 24px;
            left: 24px;
            z-index: 1001;
            background: white;
            border: 1px solid var(--border);
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            box-shadow: var(--shadow-md);
        }

        .sidebar-toggle svg {
            width: 20px;
            height: 20px;
            stroke: var(--text-primary);
        }

        /* Main Layout */
        .main-content {
            margin-left: 280px;
            min-height: 100vh;
            transition: margin-left 0.3s ease;
        }

        /* Top Bar */
        .top-bar {
            background: white;
            border-bottom: 1px solid var(--border);
            padding: 20px 40px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: sticky;
            top: 0;
            z-index: 100;
            backdrop-filter: blur(8px);
            background: rgba(255, 255, 255, 0.95);
        }

        .breadcrumb {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
            color: var(--text-secondary);
        }

        .breadcrumb a {
            color: var(--text-secondary);
            text-decoration: none;
            transition: color 0.2s;
        }

        .breadcrumb a:hover {
            color: var(--accent);
        }

        .breadcrumb-separator {
            color: var(--text-muted);
        }

        .breadcrumb-current {
            color: var(--text-primary);
            font-weight: 500;
        }

        /* Content Area */
        .content-wrapper {
            padding: 40px;
            max-width: 1200px;
        }

        /* Page Header */
        .page-title {
            font-family: 'Outfit', sans-serif;
            font-size: 32px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .page-description {
            color: var(--text-secondary);
            font-size: 15px;
            margin-bottom: 32px;
        }

        /* Form Card */
        .form-container {
            background: var(--bg-card);
            border-radius: 16px;
            border: 1px solid var(--border);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            max-width: 700px;
        }

        .form-header {
            padding: 24px 32px;
            border-bottom: 1px solid var(--border);
            background: #FAFBFC;
        }

        .form-header h3 {
            font-family: 'Outfit', sans-serif;
            font-size: 18px;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 4px;
        }

        .form-header p {
            font-size: 14px;
            color: var(--text-secondary);
        }

        .form-body {
            padding: 32px;
        }

        /* Form Groups */
        .form-grid {
            display: grid;
            gap: 24px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .required {
            color: #EF4444;
        }

        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid var(--border);
            border-radius: 8px;
            font-size: 15px;
            font-family: 'DM Sans', sans-serif;
            color: var(--text-primary);
            background: white;
            transition: all 0.2s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .form-input::placeholder {
            color: var(--text-muted);
        }

        .input-hint {
            font-size: 13px;
            color: var(--text-secondary);
            margin-top: 4px;
        }

        /* Form Actions */
        .form-footer {
            padding: 24px 32px;
            border-top: 1px solid var(--border);
            background: #FAFBFC;
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        .btn {
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            font-family: 'DM Sans', sans-serif;
            text-decoration: none;
        }

        .btn-primary {
            background: var(--accent);
            color: white;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .btn-primary:hover {
            background: var(--accent-hover);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
            transform: translateY(-1px);
        }

        .btn-primary:active {
            transform: translateY(0);
        }

        .btn-secondary {
            background: white;
            color: var(--text-secondary);
            border: 1.5px solid var(--border);
        }

        .btn-secondary:hover {
            border-color: var(--text-secondary);
            color: var(--text-primary);
        }

        /* Info Alert */
        .alert {
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 24px;
            display: flex;
            align-items: start;
            gap: 12px;
            font-size: 14px;
        }

        .alert-info {
            background: #EFF6FF;
            border: 1px solid #DBEAFE;
            color: #1E40AF;
        }

        .alert-icon {
            width: 20px;
            height: 20px;
            flex-shrink: 0;
        }

        /* Overlay */
        .overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
            backdrop-filter: blur(2px);
        }

        .overlay.active {
            display: block;
        }

        /* Icons SVG */
        .icon {
            width: 20px;
            height: 20px;
        }

        /* Responsive */
        @media (max-width: 968px) {
            .sidebar {
                transform: translateX(-280px);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .sidebar-toggle {
                display: block;
            }

            .main-content {
                margin-left: 0;
            }

            .top-bar {
                padding: 16px 20px;
                padding-left: 60px;
            }

            .content-wrapper {
                padding: 24px 20px;
            }

            .page-title {
                font-size: 24px;
            }

            .form-body,
            .form-header,
            .form-footer {
                padding: 24px 20px;
            }

            .form-footer {
                flex-direction: column-reverse;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }
        }

        /* Animations */
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-container {
            animation: slideUp 0.4s ease-out;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--bg-main);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--border);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--text-muted);
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <nav class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="logo">
                <div class="logo-icon">E</div>
                <h1>EduManager</h1>
            </div>
            <div class="logo-tagline">Gestion académique</div>
        </div>
        <ul class="sidebar-menu">
            <li>
                <a href="<%= request.getContextPath() %>/index.jsp">
                    <span class="menu-icon">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                        </svg>
                    </span>
                    Accueil
                </a>
            </li>
            <li>
                <a href="<%= request.getContextPath() %>/etudiant">
                    <span class="menu-icon">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                        </svg>
                    </span>
                    Étudiants
                </a>
            </li>
            <li>
                <a href="<%= request.getContextPath() %>/etudiant?action=add" class="active">
                    <span class="menu-icon">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                        </svg>
                    </span>
                    Ajouter un étudiant
                </a>
            </li>
        </ul>
    </nav>

    <!-- Mobile Toggle -->
    <button class="sidebar-toggle" onclick="toggleSidebar()">
        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
        </svg>
    </button>

    <!-- Overlay -->
    <div class="overlay" id="overlay" onclick="toggleSidebar()"></div>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Top Bar -->
        <div class="top-bar">
            <nav class="breadcrumb">
                <a href="<%= request.getContextPath() %>/etudiant">Étudiants</a>
                <span class="breadcrumb-separator">/</span>
                <span class="breadcrumb-current">Ajouter</span>
            </nav>
        </div>

        <!-- Content -->
        <div class="content-wrapper">
            <h1 class="page-title">Ajouter un nouvel étudiant</h1>
            <p class="page-description">Créez un nouveau profil étudiant en renseignant les informations ci-dessous.</p>

            <!-- Form Container -->
            <div class="form-container">
                <div class="form-header">
                    <h3>Informations de l'étudiant</h3>
                    <p>Les champs marqués d'un astérisque (*) sont obligatoires</p>
                </div>

                <form action="<%= request.getContextPath() %>/etudiant" method="post">
                    <div class="form-body">
                        <div class="alert alert-info">
                            <svg class="alert-icon" fill="currentColor" viewBox="0 0 20 20">
                                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
                            </svg>
                            <div>
                                Assurez-vous que toutes les informations saisies sont correctes avant de soumettre le formulaire.
                            </div>
                        </div>

                        <div class="form-grid">
                            <div class="form-group">
                                <label class="form-label" for="nom">
                                    Nom <span class="required">*</span>
                                </label>
                                <input 
                                    type="text" 
                                    id="nom" 
                                    name="nom" 
                                    class="form-input"
                                    placeholder="Entrez le nom de famille"
                                    required
                                />
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="prenom">
                                    Prénom <span class="required">*</span>
                                </label>
                                <input 
                                    type="text" 
                                    id="prenom" 
                                    name="prenom" 
                                    class="form-input"
                                    placeholder="Entrez le prénom"
                                    required
                                />
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="cne">
                                    Code National Étudiant (CNE) <span class="required">*</span>
                                </label>
                                <input 
                                    type="text" 
                                    id="cne" 
                                    name="cne" 
                                    class="form-input"
                                    placeholder="Ex: R123456789"
                                    required
                                />
                                <div class="input-hint">Format: R suivi de 9 chiffres</div>
                            </div>

                            <div class="form-group">
                                <label class="form-label" for="email">
                                    Adresse email <span class="required">*</span>
                                </label>
                                <input 
                                    type="email" 
                                    id="email" 
                                    name="email" 
                                    class="form-input"
                                    placeholder="exemple@universite.ma"
                                    required
                                />
                                <div class="input-hint">L'email institutionnel de l'étudiant</div>
                            </div>
                        </div>
                    </div>

                    <div class="form-footer">
                        <a href="<%= request.getContextPath() %>/etudiant" class="btn btn-secondary">
                            Annuler
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <svg class="icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
                            </svg>
                            Enregistrer l'étudiant
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const overlay = document.getElementById('overlay');
            sidebar.classList.toggle('active');
            overlay.classList.toggle('active');
        }

        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', function(event) {
            const sidebar = document.getElementById('sidebar');
            const toggle = document.querySelector('.sidebar-toggle');
            
            if (window.innerWidth <= 968 && 
                sidebar.classList.contains('active') && 
                !sidebar.contains(event.target) && 
                !toggle.contains(event.target)) {
                toggleSidebar();
            }
        });

        // Handle window resize
        window.addEventListener('resize', function() {
            if (window.innerWidth > 968) {
                document.getElementById('sidebar').classList.remove('active');
                document.getElementById('overlay').classList.remove('active');
            }
        });
    </script>

</body>
</html>
