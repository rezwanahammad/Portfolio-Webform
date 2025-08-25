function toggleTheme() {
    const body = document.body;
    body.classList.toggle("dark-mode");
    const theme = body.classList.contains("dark-mode") ? "dark" : "light";
    document.cookie = "theme=" + theme + ";path=/;max-age=31536000";
}