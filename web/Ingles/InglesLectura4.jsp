<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Reading: The Three Little Pigs</title>
    <link rel="stylesheet" href="../Sistema/EstilosPMaterias.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Comic+Neue:wght@400;700&family=Bubblegum+Sans&display=swap');
        
        body {
            font-family: 'Comic Neue', cursive;
            background-color: #f7f0ff;
            margin: 0;
            padding: 0;
            color: #444;
        }
        
        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('../Imagenes/fondo4.png');
            background-size: cover;
            background-repeat: no-repeat;
            opacity: 0.15;
            z-index: -1;
        }
        
        h1 {
            font-family: 'Bubblegum Sans', cursive;
            text-align: center;
            color: #ff6b97;
            font-size: 3rem;
            text-shadow: 3px 3px 0px #ffde7c, 
                        5px 5px 0px rgba(0,0,0,0.1);
            margin-top: 30px;
            margin-bottom: 20px;
        }
        
        .page-container {
            max-width: 1100px;
            margin: 0 auto;
            position: relative;
        }
        
        .character {
            position: absolute;
            width: 120px;
            height: 120px;
            z-index: 2;
        }
        
        .pig1 {
            top: -40px;
            left: 20px;
            transform: rotate(-5deg);
        }
        
        .pig2 {
            top: -30px;
            right: 20px;
            transform: rotate(5deg);
        }
        
        .wolf {
            bottom: -40px;
            right: 30px;
            width: 140px;
            height: 140px;
        }
        
        .cuento {
            background-color: rgba(255, 255, 255, 0.92);
            border: none;
            border-radius: 20px;
            padding: 30px 40px;
            margin: 30px auto;
            max-width: 900px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1),
                        0 0 0 15px #ffde7c,
                        0 0 0 18px #ff9dbb;
            font-size: 1.25rem;
            line-height: 1.6;
            position: relative;
        }
        
        .dialogue {
            font-family: 'Bubblegum Sans', cursive;
            color: #9d54b9;
            font-size: 1.3rem;
        }
        
        .story-image {
            display: block;
            margin: 30px auto;
            max-width: 90%;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transform: rotate(-1deg);
            border: 8px solid white;
        }
        
        .back-btn {
            font-size: 2.5rem;
            color: #ff6b97;
            background: #ffde7c;
            border: none;
            border-radius: 50%;
            width: 70px;
            height: 70px;
            cursor: pointer;
            margin: 20px auto;
            display: block;
            transition: all 0.3s;
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
        }
        
        .back-btn:hover {
            transform: scale(1.1);
            background: #ff9dbb;
            color: #fff;
        }
        
        footer {
            margin-top: 40px;
            padding: 20px 0;
            font-size: 1rem;
            color: #777;
            font-family: 'Comic Neue', cursive;
            background-color: #ffde7c;
            border-top: 5px dashed #ff9dbb;
            text-align: center;
        }
        
        .page-divider {
            height: 20px;
            background: repeating-linear-gradient(
                45deg,
                #ff9dbb,
                #ff9dbb 10px,
                #ffde7c 10px,
                #ffde7c 20px
            );
            margin: 40px 0;
            border-radius: 10px;
        }
        
        /* Story sections with visual markers */
        .story-section {
            position: relative;
            padding-left: 15px;
            margin-bottom: 20px;
            border-left: 4px solid #ffde7c;
        }
        
        .story-section:nth-child(3n+1) {
            border-left-color: #ff9dbb;
        }
        
        .story-section:nth-child(3n+2) {
            border-left-color: #9d54b9;
        }
        
        /* Interactive elements */
        .cloud-bubble {
            background-color: #e9f6ff;
            border-radius: 30px;
            padding: 15px 25px;
            margin: 20px auto;
            position: relative;
            width: 80%;
            box-shadow: 0 5px 10px rgba(0,0,0,0.05);
        }
        
        .cloud-bubble:before {
            content: "";
            position: absolute;
            bottom: -15px;
            left: 30px;
            border: 15px solid transparent;
            border-top-color: #e9f6ff;
            border-bottom: 0;
        }
        
        /* House icons */
        .house-icon {
            display: inline-block;
            margin: 0 5px;
            font-size: 1.5rem;
        }
        
        .straw-house {
            color: #e8c05b;
        }
        
        .stick-house {
            color: #b5813f;
        }
        
        .brick-house {
            color: #c25450;
        }
        
        /* Reading progress tracker */
        .progress-container {
            width: 80%;
            margin: 20px auto;
            background-color: #f0f0f0;
            border-radius: 30px;
            height: 15px;
            position: relative;
            overflow: hidden;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .progress-bar {
            width: 0;
            height: 100%;
            background: linear-gradient(90deg, #ffde7c, #ff9dbb, #9d54b9);
            border-radius: 30px;
            transition: width 0.3s ease-in-out;
        }
        
        /* Responsive design */
        @media (max-width: 768px) {
            .cuento {
                padding: 20px;
                font-size: 1.1rem;
            }
            
            h1 {
                font-size: 2.2rem;
            }
            
            .character {
                width: 80px;
                height: 80px;
            }
            
            .back-btn {
                font-size: 2rem;
                width: 50px;
                height: 50px;
            }
        }
    </style>
</head>

<body>
    <!-- Barra de Navegación -->
    <jsp:include page="../Sistema/BarraNavegacion.jsp" />
    
    <div class="page-container">
        <!-- Decorative images -->
        <img src="/api/placeholder/120/120" alt="Little Pig Character" class="character pig1">
        <img src="/api/placeholder/120/120" alt="Little Pig Character" class="character pig2">
        
        <h1>The Three Little Pigs</h1>
        
        <div class="progress-container">
            <div class="progress-bar" id="readingProgress"></div>
        </div>
        
        <center>
            <a href="Ingles-LecturaHistorias.jsp">
                <button class="back-btn">
                    <i class="fas fa-arrow-left"></i>
                </button>
            </a>
        </center>

        <div class="cuento">
            <div class="story-section">
                <p>In a small village not far away, there lived a mother pig and her three little pigs. They were all very happy until one day, the mother pig said:</p>
                
                <div class="cloud-bubble dialogue">
                    "Children, you have all grown up, it's time for you to become adult pigs and live on your own."
                </div>
                
                <p>Before letting them go, she told them:</p>
                
                <div class="cloud-bubble dialogue">
                    "Nothing comes easy in the world, so you must learn to work hard to achieve your dreams."
                </div>
                
                <p>The mother pig gave each of them a kiss on the cheek and the three little pigs went out into the world.</p>
            </div>
            
            <div class="page-divider"></div>
            
            <div class="story-section">
                <p>The youngest pig, who was very, very lazy, did not listen to the mother pig's words and decided to build a house of straw <i class="house-icon straw-house fas fa-home"></i> so he could finish quickly and lie down to rest.</p>
                
                <p>The middle pig, who was half lazy, only half listened to the mother pig's words and built a house of sticks <i class="house-icon stick-house fas fa-home"></i>. The house turned out crooked because, being half lazy, he didn't bother to read the instructions for building it properly.</p>
                
                <p>The oldest pig, who was the most diligent of all, paid close attention to the mother pig's words and decided to build a brick house <i class="house-icon brick-house fas fa-home"></i>. Building her house would take much more time, but she didn't mind; her new home would protect her from the cold and also from the fearsome big bad wolf...</p>
            </div>
            
            <div class="page-divider"></div>
            
            <div class="story-section">
                <p>Speaking of the fearsome big bad wolf, he was wandering through the forest when he saw the youngest pig peacefully sleeping through his window. The wolf became very hungry and thought the pig would make a delicious snack, so he knocked on the door and said:</p>
                
                <div class="cloud-bubble dialogue">
                    "Little pig, little pig, let me in."
                </div>
                
                <p>The youngest pig woke up startled and replied:</p>
                
                <div class="cloud-bubble dialogue">
                    "No, no, and no! I will never let you in."
                </div>
                
                <p>The big bad wolf became furious and said:</p>
                
                <div class="cloud-bubble dialogue">
                    "I'll huff and I'll puff and I'll blow your house down."
                </div>
                
                <p>The wolf huffed and puffed with all his might, and the straw house collapsed. Fortunately, the youngest pig had escaped to the middle pig's house while the wolf kept blowing.</p>
            </div>
            
            <div class="page-divider"></div>
            
            <div class="story-section">
                <p>Feeling deceived, the big bad wolf went to the middle pig's house and knocked on the door, saying:</p>
                
                <div class="cloud-bubble dialogue">
                    "Little pig, little pig, let me in."
                </div>
                
                <p>The middle pig responded:</p>
                
                <div class="cloud-bubble dialogue">
                    "No, no, and no! I will never let you in."
                </div>
                
                <p>The hungry wolf became furious and said:</p>
                
                <div class="cloud-bubble dialogue">
                    "I'll huff and I'll puff and I'll blow your house down."
                </div>
                
                <p>The wolf huffed and puffed with all his might, and the stick house fell down. Luckily, the two pigs had run to the oldest pig's house while the wolf kept blowing and puffing. The two brothers, nearly out of breath, told her the whole story.</p>
            </div>
            
            <img src="../Imagenes/lect4.png" alt="Three Little Pigs Story" class="story-image">
            
            <div class="story-section">
                <div class="cloud-bubble dialogue">
                    "Brothers, it's very cold, and you've had a rough time, so let's enjoy the night by the warmth of the fire."
                </div>
                
                <p>Said the oldest pig, and she lit the fireplace. Just then, the three pigs heard a knock on the door.</p>
                
                <div class="cloud-bubble dialogue">
                    "Little pig, little pig, let me in."
                </div>
                
                <p>Said the big bad wolf. The oldest pig replied:</p>
                
                <div class="cloud-bubble dialogue">
                    "No, no, and no! I will never let you in."
                </div>
                
                <p>The hungry wolf became even angrier and said:</p>
                
                <div class="cloud-bubble dialogue">
                    "I'll huff and I'll puff and I'll blow your house down."
                </div>
                
                <p>The wolf huffed and puffed with all his might, but the brick house resisted his blows. More furious and hungry than ever, he decided to climb to the roof and get in through the chimney. As he slid down the chimney, the wolf burned his tail on the fire.</p>
                
                <div class="cloud-bubble dialogue">
                    "Ouch!"
                </div>
                
                <p>The wolf shouted. And he ran off into the forest, never to be seen again.</p>
            </div>
            
            <div class="page-divider"></div>
            
            <div class="story-section">
                <p>One day, mother pig went to visit her dear little pigs and discovered that all three of them had built brick houses. The three little pigs had learned their lesson:</p>
                
                <div class="cloud-bubble dialogue" style="background-color: #ffe8f7; text-align: center; font-size: 1.4rem;">
                    "Nothing comes easy in the world, so we must work hard to achieve our dreams."
                </div>
            </div>
            
            <img src="/api/placeholder/140/140" alt="Wolf Character" class="character wolf">
        </div>
    </div>

    <footer>
        <p>
            &copy; 2024 Children's Readings Project KIDI
        </p>
        <p>
            <i class="fas fa-book"></i> Keep reading for more adventures! <i class="fas fa-star"></i>
        </p>
    </footer>
    
    <script>
        // Simple reading progress tracker
        const readingProgress = document.getElementById('readingProgress');
        const storyContent = document.querySelector('.cuento');
        
        window.addEventListener('scroll', () => {
            const scrollTop = window.scrollY;
            const scrollHeight = document.body.scrollHeight - window.innerHeight;
            const scrollPercentage = (scrollTop / scrollHeight) * 100;
            
            readingProgress.style.width = scrollPercentage + '%';
        });
        
        // Animate story sections when they come into view
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = 1;
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, { threshold: 0.1 });
        
        document.querySelectorAll('.story-section').forEach(section => {
            section.style.opacity = 0;
            section.style.transform = 'translateY(20px)';
            section.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
            observer.observe(section);
        });
    </script>
</body>

</html>