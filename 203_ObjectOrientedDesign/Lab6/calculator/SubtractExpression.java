class SubtractExpression extends BinaryExpression implements Expression
{

   public SubtractExpression(final Expression lft, final Expression rht)
   {
      super(lft, rht, "-");
   }

   @Override
   protected double _applyOperator(double res1, double res2) {
      return res1 - res2;
   }
}

