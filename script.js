(function () {
  const cfg = window.TIDETIC || {
    pricing: { currency: "KES", monthly: 299, yearly: 3000 },
    downloads: { android: "", windows: "" },
    contact: "hello@tidetic.com",
  };

  const yearEl = document.getElementById("year");
  if (yearEl) yearEl.textContent = String(new Date().getFullYear());

  const contactEl = document.getElementById("contact-email");
  if (contactEl && cfg.contact) {
    contactEl.href = `mailto:${cfg.contact}`;
    contactEl.textContent = cfg.contact;
  }

  function wireDownload(id, url, downloadName) {
    const el = document.getElementById(id);
    if (!el || !url) return;
    el.href = url;
    el.setAttribute("rel", "noopener noreferrer");
    if (downloadName) el.setAttribute("download", downloadName);
  }

  wireDownload("dl-android", cfg.downloads.android, "tidetic-android.apk");
  wireDownload("dl-windows", cfg.downloads.windows);

  const head = document.querySelector(".site-head");
  let lastY = 0;

  window.addEventListener(
    "scroll",
    () => {
      const y = window.scrollY;
      if (!head) return;
      head.style.opacity = y > 80 && y > lastY ? "0.92" : "1";
      head.style.transform =
        y > 80 && y > lastY
          ? "translateX(-50%) translateY(-4px)"
          : "translateX(-50%)";
      lastY = y;
    },
    { passive: true }
  );
})();
