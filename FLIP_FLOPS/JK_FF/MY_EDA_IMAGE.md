
# DESIGN CODE

<img width="1911" height="906" alt="image" src="https://github.com/user-attachments/assets/00e8fb73-999c-4ebf-93a3-c1c328d89904" />


# WAVWFORMS 

<img width="1913" height="225" alt="image" src="https://github.com/user-attachments/assets/160ff796-60c6-4873-b571-72ccc8c5d985" />
# OUTPUTS
# the values are evaluated at the first clk edge and assigned to LHS for the next clk edge.
at time                    0 the value of j=x k=x q=x
at time                   10 the value of j=0 k=0 q=x
at time                   20 the value of j=0 k=1 q=x
at time                   25 the value of j=0 k=1 q=0
at time                   30 the value of j=1 k=0 q=0
at time                   35 the value of j=1 k=0 q=1
at time                   40 the value of j=1 k=1 q=1
at time                   45 the value of j=1 k=1 q=0
testbench.sv:21: $finish called at 50 (1s)
