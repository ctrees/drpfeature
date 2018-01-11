import checkIfElementExists from '../lib/checkIfElementExists';

/**
 * Set the value of the given input field to a new value or add a value to the
 * current element value
 * @param  {String}   method  The method to use (add or set)
 * @param  {String}   value   The value to set the element to
 * @param  {String}   element Element selector
 */
module.exports = (method, value, element) => {
    /**
     * The command to perform on the browser object (addValue or setValue)
     * @type {String}
     */
    const command = (method === 'add') ? 'addValue' : 'setValue';

    let checkValue = value;


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
    //const text = arrayOfRestCrap[1].getText();
    const fixedElement = arrayOfRestCrap[0];
    //-- END HACK
    

    checkIfElementExists(element, false, 1);

    if (!value) {
        checkValue = '';
    }

    //browser[command](fixedElement, checkValue);
    arrayOfRestCrap[0].setValue(checkValue);
};
