export default function getLocalization(stringKey) {
  if (typeof window.air-blocks_screenReaderText === 'undefined' || typeof window.air-blocks_screenReaderText[stringKey] === 'undefined') {
    // eslint-disable-next-line no-console
    console.error(`Missing translation for ${stringKey}`);
    return '';
  }
  return window.air-blocks_screenReaderText[stringKey];
}
