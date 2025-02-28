const checkboxes = document.querySelectorAll(".cb-item");

checkboxes.forEach(checkbox => {
    checkbox.addEventListener("change", filterProducts);
});

function filterProducts() {
    const selectedOptions = [];

    checkboxes.forEach(checkbox => {
        if (checkbox.checked) {
            selectedOptions.push(checkbox.value);
        }
    });

    const products = document.querySelectorAll(".products");
    products.forEach(product => {
        const price = parseInt(product.getAttribute("data-price"));
        const priceInRange = (
            (selectedOptions.includes(">600k") && price >= 600000) ||
            (selectedOptions.includes("500-599k") && price >= 500000 && price < 600000) ||
            (selectedOptions.includes("400-499k") && price >= 400000 && price < 500000) ||
            (selectedOptions.includes("300-399k") && price >= 300000 && price < 400000) ||
            (selectedOptions.includes("200-299k") && price >= 200000 && price < 300000) ||
            (selectedOptions.includes("<299k") && price < 299000)
        );

        if (selectedOptions.length === 0 || priceInRange) {
            product.style.display = "block";
        } else {
            product.style.display = "none";
        }
    });
}

// Thêm dòng sau để kích hoạt lọc sản phẩm khi trang web được nạp:
filterProducts();
