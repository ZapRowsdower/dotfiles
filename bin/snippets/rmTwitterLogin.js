/**
 * For use in browser only! Will not work in shell/nodejs! 
 * Removes the annoying twitter login prompt when browsing.
 */
(() => {
    const htmlElem = document.querySelector('html');

    // Remove scroll halting styles: overflow: hidden and overscroll-behavior-y: none
    htmlElem.setAttribute('style', 'font-size: 15px;margin-right: 15px;');

    // Remove login UIs
    const loginPrompt = document.querySelector('[role=dialog]');
    const bottomBar = document.querySelector('[data-testid="BottomBar"]');
    bottomBar.remove();
    loginPrompt.remove();
})();