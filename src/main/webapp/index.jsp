<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduManager - Accueil</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #1E40AF;
            --primary-dark: #1E3A8A;
            --accent: #3B82F6;
            --success: #10b981;
            --orange: #f59e0b;
            --purple: #6366F1;
            --text-primary: #0F172A;
            --text-secondary: #64748B;
            --text-muted: #94A3B8;
            --bg-main: #F8FAFC;
        }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--bg-main);
            color: var(--text-primary);
            overflow-x: hidden;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        /* Animated gradient background */
        body::before {
            content: '';
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: -1;
            background: 
                radial-gradient(circle at 20% 50%, rgba(30, 64, 175, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(59, 130, 246, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 40% 20%, rgba(16, 185, 129, 0.03) 0%, transparent 50%);
            animation: gradient-shift 15s ease infinite;
        }

        @keyframes gradient-shift {
            0%, 100% { transform: translate(0, 0); }
            50% { transform: translate(-2%, -2%); }
        }

        /* Navbar */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.03);
            animation: slideDown 0.6s ease-out;
        }

        @keyframes slideDown {
            from { transform: translateY(-100%); }
            to { transform: translateY(0); }
        }

        .navbar-content {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-family: 'Outfit', sans-serif;
            font-size: 24px;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo-icon {
            width: 36px;
            height: 36px;
            background: var(--accent);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .nav-links {
            display: flex;
            gap: 40px;
            align-items: center;
        }

        .nav-links a {
            color: var(--text-secondary);
            text-decoration: none;
            font-weight: 500;
            font-size: 15px;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-links a:hover {
            color: var(--primary);
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary);
            transition: width 0.3s ease;
        }

        .nav-links a:hover::after {
            width: 100%;
        }

        .btn-logout {
            padding: 10px 24px;
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.2);
            color: #ef4444;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .btn-logout:hover {
            background: #ef4444;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
        }

        /* Hero Section */
        .hero {
            margin-top: 100px;
            padding: 100px 40px 80px;
            max-width: 1400px;
            margin-left: auto;
            margin-right: auto;
            animation: fadeInUp 0.8s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero-content {
            text-align: center;
            max-width: 900px;
            margin: 0 auto;
        }

        .hero-badge {
            display: inline-block;
            padding: 10px 24px;
            background: linear-gradient(135deg, rgba(30, 64, 175, 0.1), rgba(59, 130, 246, 0.1));
            border: 1px solid rgba(30, 64, 175, 0.2);
            border-radius: 50px;
            font-size: 14px;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 30px;
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .hero h1 {
            font-family: 'Outfit', sans-serif;
            font-size: 72px;
            font-weight: 800;
            line-height: 1.1;
            margin-bottom: 24px;
            background: linear-gradient(135deg, var(--text-primary) 0%, var(--text-secondary) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: fadeInUp 0.8s ease-out 0.3s both;
        }

        .hero p {
            font-size: 20px;
            color: var(--text-secondary);
            line-height: 1.6;
            margin-bottom: 40px;
            animation: fadeInUp 0.8s ease-out 0.4s both;
        }

        .hero-buttons {
            display: flex;
            gap: 16px;
            justify-content: center;
            flex-wrap: wrap;
            animation: fadeInUp 0.8s ease-out 0.5s both;
        }

        .btn {
            padding: 16px 32px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 16px;
            text-decoration: none;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            box-shadow: 0 10px 30px rgba(30, 64, 175, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(30, 64, 175, 0.4);
        }

        .btn-secondary {
            background: white;
            color: var(--text-primary);
            border: 2px solid #e2e8f0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .btn-secondary:hover {
            background: #f8fafc;
            border-color: var(--primary);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        /* Stats Section */
        .stats {
            max-width: 1400px;
            margin: 80px auto;
            padding: 0 40px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 24px;
        }

        .stat-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            padding: 32px;
            transition: all 0.3s ease;
            animation: fadeInUp 0.6s ease-out both;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
        }

        .stat-card:nth-child(1) { animation-delay: 0.1s; border-top: 3px solid var(--primary); }
        .stat-card:nth-child(2) { animation-delay: 0.2s; border-top: 3px solid var(--success); }
        .stat-card:nth-child(3) { animation-delay: 0.3s; border-top: 3px solid var(--purple); }
        .stat-card:nth-child(4) { animation-delay: 0.4s; border-top: 3px solid var(--orange); }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
        }

        .stat-icon {
            font-size: 40px;
            margin-bottom: 16px;
        }

        .stat-number {
            font-size: 48px;
            font-weight: 800;
            margin-bottom: 8px;
            color: var(--text-primary);
        }

        .stat-card:nth-child(1) .stat-number { color: var(--primary); }
        .stat-card:nth-child(2) .stat-number { color: var(--success); }
        .stat-card:nth-child(3) .stat-number { color: var(--purple); }
        .stat-card:nth-child(4) .stat-number { color: var(--orange); }

        .stat-label {
            color: var(--text-secondary);
            font-size: 16px;
            font-weight: 500;
        }

        /* Features Grid */
        .features {
            max-width: 1400px;
            margin: 100px auto;
            padding: 0 40px;
        }

        .section-header {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-header h2 {
            font-family: 'Outfit', sans-serif;
            font-size: 48px;
            font-weight: 800;
            margin-bottom: 16px;
            color: var(--text-primary);
        }

        .section-header p {
            font-size: 18px;
            color: var(--text-secondary);
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 32px;
        }

        .feature-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            padding: 40px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            animation: fadeInUp 0.6s ease-out both;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.03);
        }

        .feature-card:nth-child(1) { animation-delay: 0.1s; }
        .feature-card:nth-child(2) { animation-delay: 0.2s; }
        .feature-card:nth-child(3) { animation-delay: 0.3s; }
        .feature-card:nth-child(4) { animation-delay: 0.4s; }
        .feature-card:nth-child(5) { animation-delay: 0.5s; }
        .feature-card:nth-child(6) { animation-delay: 0.6s; }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 0;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            transition: height 0.3s ease;
        }

        .feature-card:hover::before {
            height: 100%;
        }

        .feature-card:hover {
            border-color: var(--primary);
            transform: translateY(-8px);
            box-shadow: 0 20px 40px rgba(30, 64, 175, 0.15);
        }

        .feature-icon {
            font-size: 48px;
            margin-bottom: 24px;
        }

        .feature-title {
            font-family: 'Outfit', sans-serif;
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 12px;
            color: var(--text-primary);
        }

        .feature-desc {
            color: var(--text-secondary);
            line-height: 1.6;
            font-size: 15px;
        }

        /* CTA Section */
        .cta {
            max-width: 1200px;
            margin: 100px auto 80px;
            padding: 60px 40px;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            border-radius: 24px;
            text-align: center;
            position: relative;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(30, 64, 175, 0.3);
        }

        .cta::before {
            content: '';
            position: absolute;
            width: 500px;
            height: 500px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            top: -250px;
            right: -250px;
        }

        .cta::after {
            content: '';
            position: absolute;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            bottom: -150px;
            left: -150px;
        }

        .cta-content {
            position: relative;
            z-index: 1;
        }

        .cta h2 {
            font-family: 'Outfit', sans-serif;
            font-size: 42px;
            font-weight: 800;
            margin-bottom: 16px;
            color: white;
        }

        .cta p {
            font-size: 18px;
            color: rgba(255, 255, 255, 0.95);
            margin-bottom: 32px;
        }

        .cta .btn {
            background: white;
            color: var(--primary);
            font-weight: 700;
        }

        .cta .btn:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.3);
        }

        /* Mobile Menu Toggle */
        .menu-toggle {
            display: none;
            background: none;
            border: none;
            color: var(--text-primary);
            font-size: 24px;
            cursor: pointer;
        }

        /* Responsive */
        @media (max-width: 968px) {
            .navbar-content {
                padding: 16px 20px;
            }

            .nav-links {
                display: none;
                position: fixed;
                top: 70px;
                left: 0;
                right: 0;
                background: rgba(255, 255, 255, 0.98);
                backdrop-filter: blur(20px);
                padding: 20px;
                flex-direction: column;
                gap: 20px;
                border-bottom: 1px solid #e2e8f0;
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            }

            .nav-links.active {
                display: flex;
            }

            .menu-toggle {
                display: block;
            }

            .hero {
                margin-top: 80px;
                padding: 60px 20px 40px;
            }

            .hero h1 {
                font-size: 42px;
            }

            .hero p {
                font-size: 18px;
            }

            .hero-buttons {
                flex-direction: column;
            }

            .stats {
                padding: 0 20px;
                grid-template-columns: repeat(2, 1fr);
            }

            .features {
                padding: 0 20px;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }

            .section-header h2 {
                font-size: 36px;
            }

            .cta {
                margin: 60px 20px 40px;
                padding: 40px 20px;
            }

            .cta h2 {
                font-size: 32px;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar">
        <div class="navbar-content">
            <div class="logo">
                <div class="logo-icon">E</div>
                EduManager
            </div>
            <div class="nav-links" id="navLinks">
                <a href="<%= request.getContextPath() %>/index.jsp">Accueil</a>
                <a href="<%= request.getContextPath() %>/etudiant">Étudiants</a>
                <a href="<%= request.getContextPath() %>/etudiant?action=add">Ajouter</a>
             
                <a href="<%= request.getContextPath() %>/login.jsp" 
                   class="btn-logout"
                   onclick="return confirm('Êtes-vous sûr de vouloir vous déconnecter ?')">
                    Déconnexion
                </a>
            </div>
            <button class="menu-toggle" onclick="toggleMenu()">☰</button>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <div class="hero-badge">✨ Plateforme moderne de gestion</div>
            <h1>Gérez vos étudiants en toute simplicité</h1>
            <p>Une solution complète et intuitive pour la gestion des étudiants, conçue pour vous faire gagner du temps et améliorer votre efficacité.</p>
            <div class="hero-buttons">
                <a href="<%= request.getContextPath() %>/etudiant" class="btn btn-primary">
                    <svg style="width: 20px; height: 20px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                    </svg>
                    Voir les étudiants
                </a>
                <a href="<%= request.getContextPath() %>/etudiant?action=add" class="btn btn-secondary">
                    <svg style="width: 20px; height: 20px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                    </svg>
                    Ajouter un étudiant
                </a>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats">
        <div class="stat-card">
            <div class="stat-icon">👥</div>
            <div class="stat-number">0</div>
            <div class="stat-label">Étudiants inscrits</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">✅</div>
            <div class="stat-number">0</div>
            <div class="stat-label">Profils actifs</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">📚</div>
            <div class="stat-number">0</div>
            <div class="stat-label">Cours disponibles</div>
        </div>
        <div class="stat-card">
            <div class="stat-icon">📊</div>
            <div class="stat-number">100%</div>
            <div class="stat-label">Disponibilité</div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features">
        <div class="section-header">
            <h2>Tout ce dont vous avez besoin</h2>
            <p>Des fonctionnalités puissantes pour gérer vos étudiants efficacement</p>
        </div>
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon">⚡</div>
                <div class="feature-title">Ultra rapide</div>
                <div class="feature-desc">
                    Interface optimisée pour une navigation fluide et des chargements instantanés
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🔍</div>
                <div class="feature-title">Recherche intelligente</div>
                <div class="feature-desc">
                    Trouvez n'importe quel étudiant en quelques secondes grâce à notre moteur de recherche avancé
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📱</div>
                <div class="feature-title">100% Responsive</div>
                <div class="feature-desc">
                    Accédez à vos données depuis n'importe quel appareil : ordinateur, tablette ou smartphone
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🔒</div>
                <div class="feature-title">Sécurité maximale</div>
                <div class="feature-desc">
                    Vos données sont protégées par des systèmes de sécurité de pointe
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">💾</div>
                <div class="feature-title">Sauvegarde automatique</div>
                <div class="feature-desc">
                    Toutes vos modifications sont automatiquement sauvegardées en temps réel
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📊</div>
                <div class="feature-title">Statistiques détaillées</div>
                <div class="feature-desc">
                    Obtenez des insights précis sur vos étudiants avec des rapports complets
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta">
        <div class="cta-content">
            <h2>Prêt à commencer ?</h2>
            <p>Rejoignez des centaines d'établissements qui font confiance à EduManager</p>
            <a href="<%= request.getContextPath() %>/etudiant?action=add" class="btn">
                <svg style="width: 20px; height: 20px;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"/>
                </svg>
                Ajouter votre premier étudiant
            </a>
        </div>
    </section>

    <script>
        function toggleMenu() {
            const navLinks = document.getElementById('navLinks');
            navLinks.classList.toggle('active');
        }
    </script>

</body>
</html>
