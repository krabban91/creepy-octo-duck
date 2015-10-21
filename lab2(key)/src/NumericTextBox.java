/**
 * This class represents a text box for numeric values. 
 * Its content is represented as an array of single digits.
 * -----------------------
 * Your task is to add JML contracts for each method in this class
 * that reflect the informal descriptions in the Javadoc comments.
 * Also add JML invariants for the fields "cursorPosition" and "content" that make sure that
 * - the cursorPosition is always a valid value (see comment for cursorPosition).
 * - the content before the cursor contains only single digits
 * - the content after the cursor is EMPTY
 * Furthermore, think about which methods are pure and use the appropriate annotation.
 * Do NOT implement the methods!
 * 
 * Hint: If you use variables for array indices in an assignable-clause,
 *      their values are evaluated in the pre-state.
 */
public class NumericTextBox
{
  public final int EMPTY = -1;
  
  /**
   * The current cursor position, i.e. the position after the previously entered digit.
   * If this is 0, then the cursor is placed at the very beginning of the text box.
   * Note that the number of possible cursor positions is greater by one than
   * the length of the text box.
   */
  private /*@ spec_public @*/ int cursorPosition;
  
  /**
   * This array stores the contents of the text box. At every position
   * before the cursor, there is a valid value (i.e. a single digit).
   * Positions after the cursor must be EMPTY.
   */
  private /*@ spec_public @*/ int[] content;
  
  /**
   * Holds the current TextBoxRenderer. This can be null, which means that there
   * is no renderer assigned.
   */
  private /*@ spec_public @*/ TextBoxRenderer textBoxRenderer;
  

  /**
   * Gets the currently assigned TextBoxRenderer.
   */
  /*
  @ public normal_behavior
  @ ensures result == textBoxRenderer;
  @ ensures \old(textBoxRenderer) == textBoxRenderer ;
   */
  public /*@ pure @*/ TextBoxRenderer getRenderer()
  {
    // ...
  }


  /**
   * Sets the TextBoxRenderer used for rendering this text box.
   * It can also be set to null, if the text box is not rendered.
   **/
   /*
   @ public normal_behavior
   @   assignable textBoxRenderer
   @   ensures textBoxRenderer == renderer;
   */
  public void setRenderer(/*@ nullable @*/ TextBoxRenderer renderer)
  {
    // ...
  }
  
  /**
   * Checks whether a given input is a single digit (i.e. between 0 and 9).
   * 
   * @param input The input character.;
   * @return true if the input is a single digit, false otherwise.;
   **/ 
  /*
   @ public normal_behaviour;
   @   ensures result == (input%10 == input);
  */
  public /*@ pure @*/ boolean isSingleDigit(int input)
  {
    // ...
  }
  
  /**
   * Clears the text box and resets the cursor to the start.
   * Also sets the contentChanged flag of the current TextBoxRenderer, if any.
   **/
  /*
   @ public normal_behavior
   @   assignable textBoxRenderer.contentChanged;
   @   assignable content[*];
   @   assignable cursorPosition;
   @   requires textBoxRenderer != null;
   @   ensures textBoxRenderer != null ==> textBoxRenderer.contentChanged;
   @   ensures \forAll int i; i < content.length && i >= 0; content[i] == EMPTY;
   @   ensures cursorPosition == 0;
   */
  public void clear()
  {
    // ...
  }

  /**
   * Enters a given input character into the text box and moves the cursor forward.
   * If the input can be processed, the contentChanged flag of the current TextBoxRenderer (if any) is set.
   * If an exception occurs, the TextBoxRenderer's showError flag is set instead.
   * 
   * @param input the input character.
   * 
   * @throws IllegalArgumentException if the input was not a single digit.
   * 
   * @throws RuntimeException if the input was valid, but the cursor is at the end
   *               of the text box and no further input can be accepted. 
   */

  /* 
  @ public normal_behaviour
  @   assignable cursorPosition;
  @   assignable content[cursorPosition];
  @   requires isSingleDigit(input);
  @   ensures textBoxRenderer != null ==> textBoxRenderer.contentChanged;
  @   ensures cursorPosition == \old(cursorPosition) + 1;
  @   ensures content[\old(cursorPosition)] == input;
  @   ensures \forAll int i; i < content.length && i >= 0; content[i] == \old(content[i]) || i == \old(cursorPosition);
  @ also
  @   public exceptional_behaviour
  @      requires !isSingleDigit(input);
  @      signals (IllegalArgumentException) true;
  @ also
  @   public exceptional_behaviour
  @      requires isSingleDigit(input);
  @      requires cursorPosition == content.length;
  @      signals (RuntimeException) true;
  */
  public void enterCharacter(int input)
  {
    // ...
  }
  
  /**
   * Deletes the most recently entered character and moves the cursor back one position.
   * Also sets the current TextBoxRenderer's contentChanged flag (if any).
   * 
   * @throws RuntimeException if the cursor is at the very beginning. In this case
   *               the showError flag of the TextBoxRenderer is set
   *               before the exception is thrown.
   */

  /*
  @ public normal_behaviour
  @   assignable content[cursorPosition-1];
  @   assignable cursorPosition;
  @   assignable textBoxRenderer.contentChanged;
  @   requires cursorPosition > 0;
  @   ensures textBoxRenderer != null ==> textBoxRenderer.contentChanged;
  @   ensures cursorPosition == \old(cursorPosition) - 1;
  @   ensures \forAll int i; i < content.length && i >= 0; content[i] == \old(content[i]) || i == cursorPosition;
  @   ensures content[cursorPosition] == EMPTY;
  @ public exceptional_behaviour
  @   requires textBoxRenderer != null
  @   requires cursorPosition == 0;
  @   assignable textBoxRenderer.showError
  @   signals (RuntimeException e) textBoxRenderer.showError;
  */
  public void backspace()
  {
    // ...
  }
}

/**
 * This class represents a renderer that is responsible for displaying the
 * text box to the user in some way.
 * -----------------------
 * You don't need to change, annotate or implement anything in this class!
 */
class TextBoxRenderer
{
  /**
   * Whether the content was changed (so the rendered text box needs a refresh).
   */
  public boolean contentChanged = false;
  
  /**
   * Whether an exception occured (which should be represented in the rendered text box). 
   */
  public boolean showError = false;
}