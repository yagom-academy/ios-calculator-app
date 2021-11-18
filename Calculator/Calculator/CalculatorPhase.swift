/// enum CalculatorPhase
///
/// [phase0]: History Stack is Empty && value isn't inputted yet
/// [phase1]: History Stack is Empty && value was inputted
/// [phase2]: History Stack isn't Empty && value isn't inputted yet
/// [phase3]: History Stack isn't Empty && value was inputted
/// [phase4]: calculation finished. Need to do "All Clear"
///
enum CalculatorPhase {
    case phase0
    case phase1
    case phase2
    case phase3
    case phase4
}
