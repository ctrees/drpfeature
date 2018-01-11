import checkIfElementExists from '../lib/checkIfElementExists';

/**
 * Perform an click action on the given element
 * @param  {String}   action  The action to perform (click or doubleClick)
 * @param  {String}   type    Type of the element (link or selector)
 * @param  {String}   element Element selector
 */
module.exports = (action, type, element) => {
    /**
     * Element to perform the action on
     * @type {String}
     */
    //const elem = (type === 'link') ? `=${element}` : element;
    const elem = `=${element}`;

    /**
     * The method to call on the browser object
     * @type {String}
     */
    const method = (action === 'click') ? 'click' : 'doubleClick';

    //-- BEGIN HACK
    //const arrayOfRestCrap = $$(element);
    //const fixedElement = arrayOfRestCrap[0];
    //-- END HACK
    
    //-was- checkIfElementExists(elem);
    //checkIfElementExists(fixedElement);
    checkIfElementExists(elem);

    //-was- browser[method](elem);
    //arrayOfRestCrap[0].click();
    browser[method](elem);
};
