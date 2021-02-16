// Mostrar o botão adicionar ao carrinho
const addButtonDiv = document.querySelectorAll(".add-to-cart");

addButtonDiv.forEach(div => {
    div.addEventListener("mouseover", () => {
        div.childNodes[3].style.display = "block";
    });
});
addButtonDiv.forEach(div => {
    div.addEventListener("mouseleave", () => {
        div.childNodes[3].style.display = "none";
    });
});

// Mostrar o carrinho de compras
const shoppingCartButton = document.querySelector("#shopping-icon");
const cartDiv = document.querySelector(".cart");

shoppingCartButton.addEventListener("click", () => cartDiv.style.display = "block");

// Fechar o carrinho de compras
const cartCloseButton = document.querySelector("#close-cart");
cartCloseButton.addEventListener("click", () => cartDiv.style.display = "none");



var Cart = class Cart {
    getProductDetails(event){
        const parentDiv = event.target.parentElement.parentElement.childNodes;
        const image = parentDiv[1].childNodes[1].src;
        const productName = parentDiv[3].innerHTML;
        const price = parentDiv[5].innerHTML;
        return [image, productName, price];
    }
    
    showProductInCart(image, productName, price){
        var output = `
        <div class="cart-content">
            <img class="cart-image" src="${image}">
            <div class="product-information">
                <h6 class="cart-product">${productName}</h6>
                <p class="cart-price">${price}</p>
                <span class="remover-produto">remover</span>
            </div>
            <div class="cart-amount">
                <div class="arrow">
                    <div class="up-arrow"></div>
                </div>
                <p class="amount">1</p>
                <div class="arrow">
                    <div class="down-arrow"></div>
                </div>
            </div>
        </div>
        `;
        productsCartContainer.innerHTML += output;
    }
    
    increaseAmount(event){
        let amount = parseInt(event.target.parentElement.parentElement.childNodes[3].innerHTML, 10);
        amount < 10 ? amount++ : "";
        event.target.parentElement.parentElement.childNodes[3].innerHTML = String(amount);
    }
    
    decreaseAmount(event){
        let amount = parseInt(event.target.parentElement.parentElement.childNodes[3].innerHTML, 10);
        amount > 1 ? amount-- : "";
        event.target.parentElement.parentElement.childNodes[3].innerHTML = String(amount);
    }
    
    updatePrice(){
        var allProductsInCart = document.querySelectorAll(".cart-content");
        let sumPrice = 0;
        allProductsInCart.forEach(product => {
            var amount = parseInt(product.childNodes[5].childNodes[3].innerHTML, 10);
            var price = parseFloat(product.childNodes[3].childNodes[3].innerHTML, 10);
            sumPrice += amount*price;
        });
        var totalPriceDiv = document.querySelector("#cart-total");
        totalPriceDiv.innerHTML = String(sumPrice);
    }
    
    updateCartNumberItems(){
        var amount = document.querySelectorAll(".amount");
        let numberItems = 0;
        amount.forEach(p => {
            numberItems += parseInt(p.innerHTML, 10);
        });
        return numberItems;
    }
};




// Funcionalidades do carrinho de compras
const cart = new Cart();
const addButton = document.querySelectorAll(".add-to-cart-button");
const productsCartContainer = document.querySelector("#products-cart-container");
const cartNumberItemsDiv = document.querySelector("#cart-items");

addButton.forEach(button => button.addEventListener("click", (e) => {
    var details = cart.getProductDetails(e);
    cart.showProductInCart(details[0], details[1], details[2]);
    var removeButton = document.querySelectorAll(".remover-produto");
    removeButton.forEach(button => button.addEventListener("click", (e) => {
        e.target.parentElement.parentElement.remove();
        cart.updatePrice();
        cartNumberItemsDiv.innerHTML = String(cart.updateCartNumberItems());
    }));
    var upperArrows = document.querySelectorAll(".up-arrow");
    upperArrows.forEach(arrow => arrow.addEventListener("click", (e) => {
        cart.increaseAmount(e);
        cart.updatePrice();
        cartNumberItemsDiv.innerHTML = String(cart.updateCartNumberItems());
    }));
    var downArrows = document.querySelectorAll(".down-arrow");
    downArrows.forEach(arrow => arrow.addEventListener("click", (e) => {
        cart.decreaseAmount(e);
        cart.updatePrice();
        cartNumberItemsDiv.innerHTML = String(cart.updateCartNumberItems());
    }));
    cart.updatePrice();
    cartNumberItemsDiv.innerHTML = String(cart.updateCartNumberItems());
}));


addButtonDiv.forEach(div => {
    div.addEventListener("mouseleave", () => {
        div.childNodes[3].style.display = "none";
    });
});
