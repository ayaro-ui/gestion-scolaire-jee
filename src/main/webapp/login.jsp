<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - EduManager</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&family=DM+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'DM Sans', sans-serif;
            background: linear-gradient(135deg, #1E40AF 0%, #3B82F6 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .login-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            max-width: 900px;
            width: 100%;
            display: grid;
            grid-template-columns: 1fr 1fr;
        }

        .login-left {
            background: linear-gradient(135deg, #1E40AF 0%, #3B82F6 100%);
            color: white;
            padding: 60px 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-left h1 {
            font-family: 'Outfit', sans-serif;
            font-size: 36px;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .login-left p {
            font-size: 16px;
            opacity: 0.9;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .credentials-box {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .credentials-box h3 {
            font-size: 14px;
            margin-bottom: 15px;
            opacity: 0.8;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .credential-item {
            margin-bottom: 12px;
            font-size: 14px;
        }

        .credential-item strong {
            display: block;
            margin-bottom: 4px;
            font-size: 12px;
            opacity: 0.7;
        }

        .credential-item span {
            background: rgba(255, 255, 255, 0.2);
            padding: 6px 12px;
            border-radius: 6px;
            display: inline-block;
            font-family: 'Courier New', monospace;
        }

        .login-right {
            padding: 60px 40px;
        }

        .login-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .login-header h2 {
            font-family: 'Outfit', sans-serif;
            font-size: 28px;
            color: #0F172A;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .login-header p {
            color: #64748B;
            font-size: 14px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #0F172A;
            font-weight: 600;
            font-size: 14px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            opacity: 0.5;
        }

        .form-control {
            width: 100%;
            padding: 14px 18px 14px 45px;
            border: 2px solid #E2E8F0;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s ease;
            font-family: 'DM Sans', sans-serif;
        }

        .form-control:focus {
            outline: none;
            border-color: #3B82F6;
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
        }

        .form-control::placeholder {
            color: #94A3B8;
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #1E40AF 0%, #3B82F6 100%);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
            font-family: 'DM Sans', sans-serif;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(30, 64, 175, 0.4);
        }

        .error-message {
            background: #FEF2F2;
            border-left: 4px solid #EF4444;
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 25px;
            color: #991B1B;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .error-message::before {
            content: "⚠️";
            font-size: 20px;
        }

        .info-message {
            background: #EFF6FF;
            border-left: 4px solid #3B82F6;
            padding: 12px 15px;
            border-radius: 8px;
            margin-top: 20px;
            color: #1E40AF;
            font-size: 13px;
            text-align: center;
        }

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .remember-me {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #64748B;
        }

        .remember-me input[type="checkbox"] {
            width: auto;
            accent-color: #3B82F6;
        }

        .forgot-password {
            color: #3B82F6;
            text-decoration: none;
            font-weight: 500;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .login-container {
                grid-template-columns: 1fr;
            }

            .login-left {
                padding: 40px 30px;
            }

            .login-left h1 {
                font-size: 28px;
            }

            .login-right {
                padding: 40px 30px;
            }

            .login-header h2 {
                font-size: 24px;
            }
        }

        /* Logo/Icon */
        .app-icon {
            font-size: 64px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <!-- Left Panel -->
        <div class="login-left">
            <div class="app-icon">🎓</div>
            <h1>EduManager</h1>
            <p>Bienvenue sur votre système de gestion des étudiants. Connectez-vous pour accéder à toutes les fonctionnalités.</p>
            
            <div class="credentials-box">
                <h3>🔑 Identifiants de test</h3>
                <div class="credential-item">
                    <strong>Nom d'utilisateur</strong>
                    <span>admin</span>
                </div>
                <div class="credential-item">
                    <strong>Email</strong>
                    <span>admin@example.com</span>
                </div>
                <div class="credential-item">
                    <strong>Mot de passe</strong>
                    <span>123456</span>
                </div>
            </div>
        </div>

        <!-- Right Panel - Login Form -->
        <div class="login-right">
            <div class="login-header">
                <h2>Se connecter</h2>
                <p>Entrez vos identifiants pour continuer</p>
            </div>

            <% String error = (String) request.getAttribute("error"); %>
            <% if (error != null) { %>
                <div class="error-message">
                    <%= error %>
                </div>
            <% } %>

            <form action="<%= request.getContextPath() %>/login" method="post">
                <div class="form-group">
                    <label for="username">Nom d'utilisateur ou Email</label>
                    <div class="input-wrapper">
                        <span class="input-icon">👤</span>
                        <input type="text" 
                               id="username" 
                               name="username" 
                               class="form-control" 
                               placeholder="admin ou admin@example.com" 
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <div class="input-wrapper">
                        <span class="input-icon">🔒</span>
                        <input type="password" 
                               id="password" 
                               name="password" 
                               class="form-control" 
                               placeholder="Entrez votre mot de passe" 
                               required>
                    </div>
                </div>

                <div class="remember-forgot">
                    <label class="remember-me">
                        <input type="checkbox" name="remember">
                        Se souvenir de moi
                    </label>
                </div>

                <button type="submit" class="btn-login">
                    Se connecter
                </button>

                <div class="info-message">
                    💡 Utilisez les identifiants de test affichés à gauche
                </div>
            </form>
        </div>
    </div>

</body>
</html>
