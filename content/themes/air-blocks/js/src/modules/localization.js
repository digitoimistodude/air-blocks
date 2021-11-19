export default function getLocalization(stringKey) {
  if (typeof window.airBlocks_screenReaderText === 'undefined' || typeof window.airBlocks_screenReaderText[stringKey] === 'undefined') {
    // eslint-disable-next-line no-console
    console.error(`Missing translation for ${stringKey}`);
    return '';
  }
  return window.airBlocks_screenReaderText[stringKey];
}
