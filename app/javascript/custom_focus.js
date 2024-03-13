function setFocusSafely(selector) {
  // Check if the currently focused element is the body, indicating no specific element focus
  if (document.activeElement && document.activeElement.tagName === 'BODY') {
    const elementToFocus = document.querySelector(selector);
    if (elementToFocus) {
      elementToFocus.focus();
      console.log('Focus set to:', selector);
    }
  } else {
    console.log('Focus is already set on another element.');
  }
}
