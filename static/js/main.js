document.addEventListener('DOMContentLoaded', function () {
  var form = document.getElementById('searchForm');
  var btn = document.getElementById('searchBtn');
  var scrollBtn = document.getElementById('scrollTop');

  // Loading spinner on form submit
  if (form && btn) {
    form.addEventListener('submit', function () {
      btn.classList.add('loading');
      btn.disabled = true;
    });
  }

  // Scroll-to-top button
  if (scrollBtn) {
    var handleScroll = function () {
      if (window.scrollY > 400) {
        scrollBtn.classList.add('visible');
      } else {
        scrollBtn.classList.remove('visible');
      }
    };

    window.addEventListener('scroll', handleScroll, { passive: true });

    scrollBtn.addEventListener('click', function () {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });
  }

  // Animate result count if present
  var countBadge = document.querySelector('.badge-count');
  if (countBadge) {
    var match = countBadge.textContent.match(/\d+/);
    if (match) {
      var target = parseInt(match[0], 10);
      var current = 0;
      var step = Math.max(1, Math.floor(target / 20));
      var interval = setInterval(function () {
        current += step;
        if (current >= target) {
          current = target;
          clearInterval(interval);
        }
        countBadge.textContent = countBadge.textContent.replace(/\d+/, current);
      }, 30);
    }
  }
});
