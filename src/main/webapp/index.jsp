<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Workforce Management Portal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #1d2671 0%, #c33764 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .hero-container {
            max-width: 1200px;
            width: 100%;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
        }
        
        .hero-content {
            color: white;
        }
        
        .hero-content h1 {
            font-size: 48px;
            line-height: 1.2;
            margin-bottom: 20px;
            font-weight: 700;
        }
        
        .hero-content p {
            font-size: 20px;
            opacity: 0.9;
            margin-bottom: 30px;
            line-height: 1.6;
        }
        
        .hero-content .highlight {
            color: #ffd700;
            font-weight: bold;
        }
        
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 50px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
            transform: translateY(0);
            transition: transform 0.3s ease;
        }
        
        .login-card:hover {
            transform: translateY(-10px);
        }
        
        .login-card h2 {
            color: #1d2671;
            margin-bottom: 30px;
            font-size: 32px;
            text-align: center;
        }
        
        .btn-login {
            width: 100%;
            padding: 18px;
            background: linear-gradient(to right, #1d2671, #c33764);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            text-decoration: none;
        }
        
        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(29, 38, 113, 0.3);
        }
        
        .features {
            margin-top: 40px;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        
        .feature-item {
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 10px;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .feature-item i {
            font-size: 24px;
            margin-bottom: 10px;
            display: block;
        }
        
        @media (max-width: 992px) {
            .hero-container {
                grid-template-columns: 1fr;
                text-align: center;
            }
            
            .hero-content h1 {
                font-size: 36px;
            }
            
            .login-card {
                padding: 30px;
            }
        }
        
        @media (max-width: 576px) {
            .features {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="hero-container">
        <div class="hero-content">
            <h1>Streamline Your Workforce Management</h1>
            <p>
                Efficiently manage your team with our comprehensive 
                <span class="highlight">Employee Management System</span>. 
                From onboarding to performance tracking, we've got you covered.
            </p>
            
            <div class="features">
                <div class="feature-item">
                    <i class="fas fa-user-plus"></i>
                    <h4>Easy Onboarding</h4>
                    <p>Quick employee registration</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-chart-line"></i>
                    <h4>Performance Tracking</h4>
                    <p>Monitor team productivity</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-shield-alt"></i>
                    <h4>Secure Access</h4>
                    <p>Role-based permissions</p>
                </div>
                <div class="feature-item">
                    <i class="fas fa-file-invoice-dollar"></i>
                    <h4>Payroll Management</h4>
                    <p>Automated salary processing</p>
                </div>
            </div>
        </div>
        
        <div class="login-card">
            <h2>Welcome Back</h2>
            <p style="color: #666; text-align: center; margin-bottom: 30px;">
                Sign in to access your workforce dashboard
            </p>
            <a href="login.jsp" class="btn-login">
                <i class="fas fa-sign-in-alt"></i>
                Login to Dashboard
            </a>
            
            <div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #eee;">
                <p style="color: #666; text-align: center; font-size: 14px;">
                    <i class="fas fa-info-circle"></i>
                    Need access? Contact your HR administrator
                </p>
            </div>
        </div>
    </div>
</body>
</html>