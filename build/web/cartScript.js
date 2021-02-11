// Mostrar o botão adicionar ao carrinho
const addButtonDiv = document.querySelectorAll(".add-to-cart");
const addButton = document.querySelectorAll(".add-to-cart-button");

addButtonDiv.forEach(div => {
    div.addEventListener("mouseover", () => {
        div.childNodes[3].style.display = "block";
    })
})
addButtonDiv.forEach(div => {
    div.addEventListener("mouseleave", () => {
        div.childNodes[3].style.display = "none";
    })
})

// Mostrar o carrinho de compras
const shoppingCartButton = document.querySelector("#shopping-icon");
const cart = document.querySelector(".cart");

shoppingCartButton.addEventListener("click", () => cart.style.display = "block");

// Fechar o carrinho de compras
const cartCloseButton = document.querySelector("#close-cart");
cartCloseButton.addEventListener("click", () => cart.style.display = "none");