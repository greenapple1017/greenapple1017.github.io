document.addEventListener('DOMContentLoaded', async () => {
    try {
        const response = await fetch('books.json');
        const data = await response.json();
        
        const tbody = document.querySelector('tbody');
        
        data.books.forEach(book => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td><a href="reviews/${book.review}" class="book-title">${book.title}</a></td>
                <td>${book.author}</td>
            `;
            tbody.appendChild(row);
        });
    } catch (error) {
        console.error('책 목록을 불러올 수 없습니다:', error);
    }
});
