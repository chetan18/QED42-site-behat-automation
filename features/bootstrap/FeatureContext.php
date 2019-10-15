<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use Behat\Mink\Mink;
use Behat\MinkExtension\Context\MinkContext;
use \Drupal\DrupalExtension\Context\RawDrupalContext;


/**
 * Defines application features from the specific context.
 */
class FeatureContext extends RawDrupalContext implements Context
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @Given /^I click the icon "([^"]*)"$/
     */
    public function iClickTheIcon($selector)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find('css', $selector);

        if (empty($element)) {
            throw new Exception("No html element found for the selector ('$selector')");
        }

        $element->click();
    }

    /**
     * @Given /^I sleep for "([^"]*)" sec$/
     */
    public function iSleepForSec($arg1)
    {
        sleep($arg1);
    }

    /**
     * @Given /^I click on View Details$/
     */
    public function iClickOnViewDetails() {

        $this->getSession()->evaluateScript("document.querySelector(\".open-positions-link a\").click();");

    }

    /**
     * @Given /^I click on "([^"]*)"$/
     */
    public function iClickOn($arg1)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find('css',  $arg1);
        $element->click();
    }

    /**
     * @Given /^I click exactly on "([^"]*)" link$/
     */
    public function iClickExactlyOnLink($arg1)
    {
        $this->getSession()->evaluateScript("document.querySelector(\"". $arg1 . "\").click();");
    }

    /**
     * @Given /^I click on "([^"]*)" option from menu$/
     */
    public function iClickOnOptionFromMenu($arg1)
    {
        $script = "document.evaluate(\"//a[text()='" . $arg1 .
            "']\", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();";
        $this->getSession()->evaluateScript($script);
    }

    /**
     * @Given /^I click on "([^"]*)" client$/
     */
    public function iClickOnClient1($arg1) {

        $this->getSession()->getPage()->find("xpath", "//a[@href='/work/" . $arg1 . "']")->click();

    }

    /**
     * @Then /^I capture the screenshot of the page named as "([^"]*)"$/
     */
    public function iCaptureTheScreenshotOfThePageNamedAs($filename)
    {
        file_put_contents("Screenshots/" . $filename .".png", $this->getSession()->getScreenshot());
    }



    /**
     * @Given /^I wait for "([^"]*)" secs$/
     */
    public function iWaitForSecs($arg1)
    {
        sleep($arg1);
    }

    /**
     * @Given /^I click element "Technical Lead Developer \[6\+ years\]"$/
     */
    public function iClickElement($arg1)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find('css',  $arg1);
        $element->click();
    }



    /**
     * @Given /^I check "([^"]*)" element should have more than "([^"]*)" word count$/
     */
    public function iCheckElementShouldHaveMoreThanWordCount1($selector, $expected)
    {
        $paragraph = $this->getSession()->getPage()->find('css', $selector)->getText();
        $actual = str_word_count($paragraph);
        PHPUnit_Framework_Assert::assertGreaterThanOrEqual($expected, $actual);
        print_r("Current word count is " . $actual);
    }

    /**
     * @Given /^I click the link "([^"]*)"$/
     */
    public function iClickTheLink($arg1)
    {
        $page = $this->getSession()->getPage();
        $element = $page->find('css', $arg1);
        $element->click();
    }

    /**
     * @Then /^I should get redirected to new window$/
     */
    public function iShouldgetRedirectedToNewWindow()
    {
        $windowNames = $this->getSession()->getWindowNames();
        if (count($windowNames) > 1) {
            $this->getSession()->switchToWindow($windowNames[count($windowNames)-1]);
        }
    }

    /**
     * @Given /^I scroll "([^"]*)" into view$/
     */
    public function iScrollIntoView($arg1)
    {
        $locator = substr($arg1, 0, 1);
        switch ($locator) {
            case '/' : // XPath selector
                $function = <<<JS
(function(){
  var elem = document.evaluate($arg1, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
  elem.scrollIntoView(false);
})()
JS;
                break;
            case '#' : // ID selector
                $arg1 = substr($arg1, 1);
                $function = <<<JS
(function(){
  var elem = document.getElementById("$arg1");
  elem.scrollIntoView(false);
})()
JS;
                break;
            case '.' : // Class selector
                $arg1 = substr($arg1, 1);
                $function = <<<JS
(function(){
  var elem = document.getElementsByClassName("$arg1");
  elem[0].scrollIntoView(false);
})()
JS;
                break;
            default:
                throw new \Exception(__METHOD__ . ' Couldn\'t find selector: ' . $arg1 . ' - Allowed selectors: #id, .className, //xpath');
                break;
        }
        try {
            $this->getSession()->executeScript($function);
        } catch (Exception $e) {
            throw new \Exception(__METHOD__ . ' failed');
        }
    }

    /**
     * @Given /^I check "([^"]*)" element should have "([^"]*)" link in "([^"]*)" region$/
     */
    public function iCheckElementShouldHaveLinkInRegion($selector, $expected_url, $region)
    {
        $footer_region = $this->getSession()->getPage()->find('region', $region);
        if (!$footer_region) {
            throw new Exception($region . " region not found on page " . $this->getSession()->getCurrentUrl());
        }
        $link_element = $footer_region->find('css', $selector);
        $actual_url = $link_element->getAttribute("href");
        PHPUnit_Framework_Assert::assertEquals($expected_url, $actual_url);
    }
    /**
     * @Given /^I check "([^"]*)" element should have "([^"]*)" text in "([^"]*)" region$/
     */
    public function iCheckElementShouldHaveTextInRegion($selector, $expected_txt, $region)
    {
        $footer_region = $this->getSession()->getPage()->find('region', $region);
        $link_element = $footer_region->find('css', $selector);
        $actual_txt = $link_element->getText();
        PHPUnit_Framework_Assert::assertEquals($expected_txt, $actual_txt);
        $windowNames = $this->getSession()->getWindowNames();
        if (count($windowNames) > 1) {
            $this->getSession()->switchToWindow($windowNames[1]);
        }


    }

    /**
     * @Given /^I scroll into "([^"]*)" css element$/
     */
    public function iScrollIntoCssElement($locator)
    {
        $js_script = "document.querySelector(\"" . $locator . "\").scrollIntoView()";
        $this->getSession()->evaluateScript($js_script);
    }

    /**
     * @Then /^I should see more than "([^"]*)" blogs in blog page$/
     */
    public function iShouldSeeMoreThanBlogsInBlogPage($blogs_count)
    {
        $blog_count = $this->getBlogsCount();
        if ($blogs_count != $blog_count){
            throw new Exception("Number of blogs on the page is not matching .Expected is: " . $blogs_count . " and Actual is: " . $blog_count);
        }
    }
    public function getBlogsCount()
    {
        $total_count = $this->getSession()->getPage()->findAll('css', '.views-infinite-scroll-content-wrapper > div.views-row');
        return count($total_count);
    }

    /**
     * @Given /^I maximize browser window size$/
     */
    public function iMaximizeBrowserWindowSize()
    {
        $this->getSession()->getDriver()->maximizeWindow();
    }

    /**
     * @Given /^I will count logos with class "([^"]*)"$/
     */
    public function iWillCountLogosWithClass($selector)
    {
        $imageElements = $this->getSession()->getPage()->findAll('css', $selector);
        print_r("Logo count is" . count($imageElements));
    }

    /**
     * @Given /^Logo count is "([^"]*)" in class "([^"]*)"$/
     */
    public function logoCountIsInClass($logo_count, $selector)
    {
        $imageElements = $this->getSession()->getPage()->findAll('css', $selector);
        #print_r("Logo count is" . count($imageElements));
        if(count($imageElements)!=$logo_count)
        {
            throw new Exception("Logo count is not matching. Expected is: " . $logo_count . " and Actual is: " . count($imageElements));
        }
    }
}
