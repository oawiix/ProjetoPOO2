const darkMode = document.querySelector('.dark-mode');
const darkModeState = localStorage.getItem('darkModeState');

if (darkModeState === 'true') {
    document.body.classList.add('dark-mode-variables');
    darkMode.querySelector('span:nth-child(2)').classList.add('active');
    
} 
else {
    document.body.classList.remove('dark-mode-variables');
    darkMode.querySelector('span:nth-child(1)').classList.add('active');
}

darkMode.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode-variables');
    darkMode.querySelector('span:nth-child(1)').classList.toggle('active');
    darkMode.querySelector('span:nth-child(2)').classList.toggle('active');

    const isDarkMode = document.body.classList.contains('dark-mode-variables');
    localStorage.setItem('darkModeState', isDarkMode);

    if (isDarkMode) {
        darkMode.querySelector('span:nth-child(1)').classList.remove('active');
    } else {
        darkMode.querySelector('span:nth-child(2)').classList.remove('active');
    }
});