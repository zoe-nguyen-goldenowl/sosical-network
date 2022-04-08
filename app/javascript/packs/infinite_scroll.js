document.addEventListener("turbolinks:load", () => {
  let options = {
    root: null,
    rootMargins: "0px",
    threshold: 0.5
  };

  const observer = new IntersectionObserver(handleIntersect, options);
  // check <footer>!
  observer.observe(document.querySelector("footer"));
});

function handleIntersect(entries) {
  if (entries[0].isIntersecting) {
    getData();
  }
}

function getData() {
  var recipesTarget = document.querySelector('.infinity-scroll-target')
  
  let paginationTarget = document.querySelector('.pagination-link')
  let next_page = document.querySelector("a[rel='next']")
  if (next_page == null) { return }

  let url = next_page.href

  Rails.ajax({
    type: 'GET',
    url: url,
    dataType: 'json',
    success: (data) => {
      recipesTarget.innerHTML += data.entries
      paginationTarget.innerHTML = data.pagination
    }
  })
}
