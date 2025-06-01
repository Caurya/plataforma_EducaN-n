document.addEventListener("DOMContentLoaded", function () {
    let currentIndex = 0;
    const items = document.querySelectorAll(".news-item");
    const totalItems = items.length;
    const prevButton = document.querySelector(".prev");
    const nextButton = document.querySelector(".next");

    function updateSlider() {
        items.forEach((item, index) => {
            item.classList.remove("active");
            if (index === currentIndex) {
                item.classList.add("active");
            }
        });
    }

    prevButton.addEventListener("click", function () {
        currentIndex = (currentIndex - 1 + totalItems) % totalItems;
        updateSlider();
    });

    nextButton.addEventListener("click", function () {
        currentIndex = (currentIndex + 1) % totalItems;
        updateSlider();
    });

    setInterval(() => {
        currentIndex = (currentIndex + 1) % totalItems;
        updateSlider();
    }, 10000); // Troca automática a cada 5 segundos
});
