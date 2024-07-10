document.addEventListener('DOMContentLoaded', function() {
    function sendAjaxRequest() {
        const formData = new FormData(document.getElementById('filterForm'));
        const queryString = new URLSearchParams(formData).toString();
        const xhr = new XMLHttpRequest();
        xhr.open('GET', '/submit?' + queryString);
        xhr.onload = function() {
            if (xhr.status === 200) {
                document.getElementById('resultContainer').innerHTML = xhr.responseText;
            }
        };
        xhr.send();
    }

    document.getElementById('filterForm').querySelectorAll('input[type="checkbox"], input[type="range"]').forEach(function(element) {
        element.addEventListener('change', function() {
            sendAjaxRequest();
        });
    });

    document.getElementById('priceRange').addEventListener('input', function() {
        const value = this.value;
        document.getElementById('priceMin').textContent = `${value}원`;
        document.getElementById('priceMax').textContent = `${this.max}만원`;
        sendAjaxRequest();
    });

    document.getElementById('resetButton').addEventListener('click', function() {
        document.getElementById('redSubOptions').classList.add('hidden');
    });

    function toggleSubOptions(checkbox) {
        const subOptions = document.getElementById('redSubOptions');
        if (checkbox.checked) {
            subOptions.classList.remove('hidden');
        } else {
            subOptions.classList.add('hidden');
        }
        sendAjaxRequest();
    }

    function toggleSection(id) {
        const section = document.getElementById(id);
        if (section.classList.contains('hidden')) {
            section.classList.remove('hidden');
        } else {
            section.classList.add('hidden');
        }
    }
});
