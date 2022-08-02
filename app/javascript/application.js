// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


//script for rating system
const stars = document.querySelectorAll('.star');
let check = false;
stars.forEach(star => {
    star.addEventListener('mouseover', selectStars);
    star.addEventListener('mouseleave', unselectStars);
    star.addEventListener('click', activeSelect);
})

function selectStars(e) {
    const data = e.target;
    const stars = previousSiblings(data);
    if (!check) {
        stars.forEach(star => {
            star.classList.add('star-hover');
        })
    }
}

function unselectStars(e) {
    const data = e.target;
    const stars = previousSiblings(data);
    if (!check) {
        stars.forEach(star => {
            star.classList.remove('star-hover');
        })
    }
}

function activeSelect(e) {
    check = true;
    document.querySelector('.rating').innerHTML = 'Rating: ' + e.target.dataset.rating + '/5';
}

function previousSiblings(data) {
    let values = [data];
    while (data = data.previousSibling) {
        if (data.nodeName === 'I') {
            values.push(data);
        }
    }
    return values;
}