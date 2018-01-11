/**
 * Check if the given elements text is the same as the given text
 * @param  {String}   elementIndex   Element Index
 * @param  {String}   elementType   Element type (element or button)
 * @param  {String}   element       Element selector
 * @param  {String}   falseCase     Whether to check if the content equals the
 *                                  given text or not
 * @param  {String}   expectedText  The text to validate against
 */
module.exports = (elementIndex, elementType, element, falseCase, expectedText) => {
    /**
     * The command to execute on the browser object
     * @type {String}
     */
    let command = 'getValue';

    if (
        elementType === 'button' ||
        browser.getAttribute(element, 'value') === null
    ) {
        command = 'getText';
    }

    /**
     * The expected text to validate against
     * @type {String}
     */
    let parsedExpectedText = expectedText;

    /**
     * Whether to check if the content equals the given text or not
     * @type {Boolean}
     */
    let boolFalseCase = !!falseCase;

    // Check for empty element
    if (typeof parsedExpectedText === 'function') {
        parsedExpectedText = '';

        boolFalseCase = !boolFalseCase;
    }

    if (parsedExpectedText === undefined && falseCase === undefined) {
        parsedExpectedText = '';
        boolFalseCase = true;
    }

    //const text = browser[command](element);

    //-- BEGIN HACK
    const arrayOfRestCrap = $$(element);
 /*
    console.log(element);
    console.log(arrayOfRestCrap);
    console.log(arrayOfRestCrap[1]);
    console.log(arrayOfRestCrap[1].getText());
 */   
    //const text = browser[command](elementINeed);
    //const text = browser.element('p')[0].getText('//p[contains(.,"exists")]');
    //const text = browser.getText(arrayOfRestCrap[0]);
    const text = arrayOfRestCrap[elementIndex].getText();
    //-- END HACK
    
    if (boolFalseCase) {
        parsedExpectedText.should.not.equal(text);
    } else {
        parsedExpectedText.should.equal(text);
    }
};
