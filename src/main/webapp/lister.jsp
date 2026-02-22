<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Etudiant" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Étudiants - EduManager</title>
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
            --danger: #EF4444;
            --warning: #F59E0B;
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
            padding: 24px 40px 40px;
        }

        /* Logout Button */
        .logout-button {
            position: fixed;
            top: 24px;
            right: 40px;
            z-index: 100;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 20px;
            background: white;
            color: var(--danger);
            font-weight: 600;
            font-size: 14px;
            border-radius: 8px;
            text-decoration: none;
            border: 1.5px solid var(--border);
            box-shadow: var(--shadow-sm);
            transition: all 0.2s ease;
        }

        .logout-button:hover {
            background: var(--danger);
            color: white;
            border-color: var(--danger);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
        }

        .logout-button svg {
            width: 18px;
            height: 18px;
        }

        /* Page Header */
        .page-header {
            background: white;
            border-radius: 16px;
            border: 1px solid var(--border);
            box-shadow: var(--shadow-sm);
            padding: 32px;
            margin-bottom: 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 60px;
        }

        .page-title-section h1 {
            font-family: 'Outfit', sans-serif;
            font-size: 28px;
            font-weight: 700;
            color: var(--text-primary);
            letter-spacing: -0.5px;
            margin-bottom: 4px;
        }

        .page-subtitle {
            font-size: 14px;
            color: var(--text-secondary);
        }

        .student-badge {
            background: linear-gradient(135deg, var(--primary), var(--accent));
            color: white;
            padding: 10px 20px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3);
        }

        /* Actions Bar */
        .actions-bar {
            background: white;
            padding: 24px;
            border-radius: 16px;
            border: 1px solid var(--border);
            box-shadow: var(--shadow-sm);
            margin-bottom: 24px;
            display: flex;
            gap: 12px;
            align-items: center;
            flex-wrap: wrap;
        }

        .search-form {
            display: flex;
            gap: 12px;
            flex: 1;
            flex-wrap: wrap;
            min-width: 300px;
        }

        .search-box {
            flex: 1;
            min-width: 250px;
            position: relative;
        }

        .search-box input {
            width: 100%;
            padding: 12px 16px 12px 44px;
            border: 1.5px solid var(--border);
            border-radius: 8px;
            font-size: 15px;
            font-family: 'DM Sans', sans-serif;
            color: var(--text-primary);
            background: white;
            transition: all 0.2s ease;
        }

        .search-box input:focus {
            outline: none;
            border-color: var(--accent);
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
        }

        .search-box svg {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            width: 18px;
            height: 18px;
            stroke: var(--text-muted);
        }

        .btn {
            padding: 12px 20px;
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
            white-space: nowrap;
        }

        .btn-primary {
            background: var(--accent);
            color: white;
            box-shadow: var(--shadow-sm);
        }

        .btn-primary:hover {
            background: var(--accent-hover);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
            transform: translateY(-1px);
        }

        .btn-success {
            background: var(--success);
            color: white;
            box-shadow: var(--shadow-sm);
        }

        .btn-success:hover {
            background: #059669;
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
            transform: translateY(-1px);
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

        .btn svg {
            width: 16px;
            height: 16px;
        }

        /* Table Card */
        .table-card {
            background: white;
            border-radius: 16px;
            border: 1px solid var(--border);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead {
            background: #F8FAFC;
            border-bottom: 1px solid var(--border);
        }

        th {
            padding: 16px 20px;
            text-align: left;
            color: var(--text-secondary);
            font-weight: 600;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        td {
            padding: 20px;
            border-bottom: 1px solid var(--border);
            color: var(--text-primary);
            font-size: 15px;
        }

        tbody tr {
            transition: all 0.2s ease;
        }

        tbody tr:hover {
            background: #F8FAFC;
        }

        tbody tr:last-child td {
            border-bottom: none;
        }

        .student-name {
            font-weight: 600;
            color: var(--text-primary);
        }

        .student-email {
            color: var(--text-secondary);
        }

        .student-cne {
            font-family: 'Courier New', monospace;
            background: #F1F5F9;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 13px;
            color: var(--text-primary);
        }

        /* Actions Column */
        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .action-btn {
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 13px;
            font-weight: 500;
            transition: all 0.2s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
            border: 1px solid transparent;
        }

        .action-btn svg {
            width: 14px;
            height: 14px;
        }

        .action-btn.edit {
            background: #EFF6FF;
            color: #1E40AF;
            border-color: #DBEAFE;
        }

        .action-btn.edit:hover {
            background: #DBEAFE;
            border-color: #93C5FD;
        }

        .action-btn.delete {
            background: #FEF2F2;
            color: #DC2626;
            border-color: #FEE2E2;
        }

        .action-btn.delete:hover {
            background: #FEE2E2;
            border-color: #FECACA;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 80px 20px;
        }

        .empty-state-icon {
            font-size: 64px;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        .empty-state-title {
            font-family: 'Outfit', sans-serif;
            font-size: 20px;
            color: var(--text-primary);
            margin-bottom: 8px;
            font-weight: 600;
        }

        .empty-state-text {
            font-size: 15px;
            color: var(--text-secondary);
            margin-bottom: 24px;
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

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .page-header,
        .actions-bar,
        .table-card {
            animation: fadeInUp 0.4s ease-out;
        }

        .actions-bar {
            animation-delay: 0.1s;
        }

        .table-card {
            animation-delay: 0.2s;
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
                padding: 20px;
            }

            .logout-button {
                top: 16px;
                right: 70px;
                padding: 8px 12px;
                font-size: 13px;
            }

            .logout-button span {
                display: none;
            }

            .page-header {
                padding: 20px;
                margin-top: 60px;
                flex-direction: column;
                align-items: flex-start;
            }

            .page-title-section h1 {
                font-size: 22px;
            }

            .actions-bar {
                flex-direction: column;
                align-items: stretch;
            }

            .search-form {
                flex-direction: column;
                width: 100%;
            }

            .search-box {
                width: 100%;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            table {
                display: block;
                overflow-x: auto;
            }

            .action-buttons {
                flex-direction: column;
            }
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
                <a href="<%= request.getContextPath() %>/etudiant" class="active">
                    <span class="menu-icon">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                        </svg>
                    </span>
                    Étudiants
                </a>
            </li>
            <li>
                <a href="<%= request.getContextPath() %>/etudiant?action=add">
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

    <!-- Logout Button -->
    <a href="<%= request.getContextPath() %>/login.jsp" 
       onclick="return confirm('Êtes-vous sûr de vouloir vous déconnecter ?')"
       class="logout-button">
        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1"/>
        </svg>
        <span>Déconnexion</span>
    </a>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Page Header -->
        <div class="page-header">
            <div class="page-title-section">
                <h1>Liste des Étudiants</h1>
                <p class="page-subtitle">Gérez et consultez tous vos étudiants</p>
            </div>
            <% 
            List<Etudiant> liste = (List<Etudiant>) request.getAttribute("liste");
            int count = (liste != null) ? liste.size() : 0;
            %>
            <div class="student-badge">
                <%= count %> étudiant<%= count > 1 ? "s" : "" %>
            </div>
        </div>

        <!-- Actions Bar -->
        <div class="actions-bar">
            <a href="<%= request.getContextPath() %>/etudiant?action=add" class="btn btn-success">
                <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                </svg>
                Nouveau étudiant
            </a>
            
            <form action="<%= request.getContextPath() %>/etudiant" method="get" class="search-form">
                <div class="search-box">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                    </svg>
                    <input type="text" 
                           name="search" 
                           placeholder="Rechercher par nom, prénom ou CNE..."
                           value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
                </div>
                <button type="submit" class="btn btn-primary">
                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
                    </svg>
                    Rechercher
                </button>
                <% if (request.getParameter("search") != null && !request.getParameter("search").isEmpty()) { %>
                    <a href="<%= request.getContextPath() %>/etudiant" class="btn btn-secondary">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                        Effacer
                    </a>
                <% } %>
            </form>
        </div>

        <!-- Table -->
        <div class="table-card">
            <% if (liste != null && !liste.isEmpty()) { %>
            <table>
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>CNE</th>
                        <th>Email</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Etudiant e : liste) { %>
                    <tr>
                        <td><span class="student-name"><%= e.getNom() %></span></td>
                        <td><%= e.getPrenom() %></td>
                        <td><span class="student-cne"><%= e.getCne() %></span></td>
                        <td><span class="student-email"><%= e.getEmail() %></span></td>
                        <td>
                            <div class="action-buttons">
                                <a href="<%= request.getContextPath() %>/etudiant?action=edit&id=<%= e.getId() %>" 
                                   class="action-btn edit">
                                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                    </svg>
                                    Modifier
                                </a>
                                <a href="<%= request.getContextPath() %>/etudiant?action=delete&id=<%= e.getId() %>" 
                                   class="action-btn delete"
                                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet étudiant ?')">
                                    <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"/>
                                    </svg>
                                    Supprimer
                                </a>
                            </div>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% } else { %>
            <div class="empty-state">
                <div class="empty-state-icon">
                    <% if (request.getParameter("search") != null && !request.getParameter("search").isEmpty()) { %>
                        🔍
                    <% } else { %>
                        📭
                    <% } %>
                </div>
                <div class="empty-state-title">
                    <% if (request.getParameter("search") != null && !request.getParameter("search").isEmpty()) { %>
                        Aucun résultat trouvé
                    <% } else { %>
                        Aucun étudiant enregistré
                    <% } %>
                </div>
                <div class="empty-state-text">
                    <% if (request.getParameter("search") != null && !request.getParameter("search").isEmpty()) { %>
                        Aucun étudiant ne correspond à "<strong><%= request.getParameter("search") %></strong>"
                    <% } else { %>
                        Commencez par ajouter votre premier étudiant
                    <% } %>
                </div>
                <% if (request.getParameter("search") == null || request.getParameter("search").isEmpty()) { %>
                    <a href="<%= request.getContextPath() %>/etudiant?action=add" class="btn btn-success" style="margin-top: 20px;">
                        <svg fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                        </svg>
                        Ajouter un étudiant
                    </a>
                <% } %>
            </div>
            <% } %>
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
