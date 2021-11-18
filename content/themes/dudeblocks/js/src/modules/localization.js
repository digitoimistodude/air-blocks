export default function getLocalization(stringKey) {
  if (typeof window.dudeblocks_screenReaderText === 'undefined' || typeof window.dudeblocks_screenReaderText[stringKey] === 'undefined') {
    // eslint-disable-next-line no-console
    console.error(`Missing translation for ${stringKey}`);
    return '';
  }
  return window.dudeblocks_screenReaderText[stringKey];
}
