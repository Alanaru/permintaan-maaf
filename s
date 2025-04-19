<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Maaf Ya...</title>
  <style>
    body {
      margin: 0;
      background: linear-gradient(to bottom right, #cce0ff, #b3d1ff);
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      overflow: hidden;
    }
    .container {
      text-align: center;
      max-width: 600px;
      padding: 30px;
      background: rgba(255, 255, 255, 0.85);
      border-radius: 20px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      z-index: 1;
    }
    #message, #page2 {
      font-size: 18px;
      white-space: pre-line;
      opacity: 0;
      transition: opacity 0.5s ease-in-out;
    }
    .button {
      margin-top: 30px;
      padding: 10px 20px;
      border: none;
      border-radius: 25px;
      background-color: #6699ff;
      color: #fff;
      font-size: 16px;
      cursor: pointer;
      display: none;
    }
    .snowflake {
      position: fixed;
      top: 0;
      color: white;
      font-size: 1em;
      user-select: none;
      z-index: 0;
      animation: fall linear infinite;
    }
    @keyframes fall {
      0% { transform: translateY(0); }
      100% { transform: translateY(100vh); }
    }
    em {
      font-style: italic;
    }
  </style>
</head>
<body>

<audio autoplay loop>
  <source src="music.mp3" type="audio/mpeg">
</audio>

<div class="container">
  <div id="buzz">bzzz.. bzz..., sudah nyala ya.</div>
  <div id="message"></div>
  <div id="page2" style="display:none;">
    <p>I love u 3000<br><em>bilu.</em></p>
  </div>
  <button id="nextBtn" class="button" onclick="goToPage2()">Lanjut baca...</button>
</div>

<script>
  const messageText = `hmm oke, ini hadiah permintaan maaf ku ke kamu, untuk kemarin aku juga nyesel udah ngelakuin itu dan udah bikin hati mu sakit. semoga hadiah ini bisa bikin kamu bahagia lagi dan aku juga maaf sekali lagi udah jadi beban di hubungan ini, selalu egois dll, aku memang belum sepenuh nya pantas buat kamu, tapi kalo kamu butuh aku jangan malu buat ngomong ya`;

  const buzz = document.getElementById('buzz');
  const message = document.getElementById('message');
  const page2 = document.getElementById('page2');
  const nextBtn = document.getElementById('nextBtn');

  setTimeout(() => {
    buzz.style.display = 'none';
    setTimeout(() => {
      typeWriter(messageText, message, 0, () => {
        nextBtn.style.display = 'inline-block';
      });
    }, 3000); // jeda 3 detik setelah buzz
  }, 3000);

  function typeWriter(text, element, index, callback) {
    if (index < text.length) {
      element.innerHTML += text.charAt(index);
      element.style.opacity = 1;
      setTimeout(() => typeWriter(text, element, index + 1, callback), 40);
    } else if (callback) {
      callback();
    }
  }

  function goToPage2() {
    message.style.display = 'none';
    nextBtn.style.display = 'none';
    page2.style.display = 'block';
    page2.style.opacity = 1;
  }

  // Efek salju
  for (let i = 0; i < 50; i++) {
    let snow = document.createElement('div');
    snow.className = 'snowflake';
    snow.style.left = Math.random() * window.innerWidth + 'px';
    snow.style.animationDuration = (5 + Math.random() * 5) + 's';
    snow.innerHTML = '❄';
    document.body.appendChild(snow);
  }
</script>

</body>
</html>
