export default function getLocalization(stringKey) {
  if (typeof window.airblocks_screenReaderText === 'undefined' || typeof window.airblocks_screenReaderText[stringKey] === 'undefined') {
    // eslint-disable-next-line no-console
    console.error(`Missing translation for ${stringKey}`);
    return '';
  }
  return window.airblocks_screenReaderText[stringKey];
}
