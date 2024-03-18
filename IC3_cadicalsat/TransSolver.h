
#ifndef TRANSSOLVER_H_INCLUDED
#define TRANSSOLVER_H_INCLUDED

#include "cadical/src/internal.hpp"
#include "minisat/core/SolverTypes.h"
#include "minisat/mtl/Vec.h"

namespace Tocadical{

typedef int Var;
typedef Minisat::Lit Lit;
typedef Minisat::lbool lbool;


class Solver{

public:
    Solver();
    virtual ~Solver();

    Var     newVar();
    bool    addClause (const Minisat::vec<Lit>& ps); 
    bool    addClause (Lit p);                                  // Add a unit clause to the solver. 
    bool    addClause (Lit p, Lit q);                           // Add a binary clause to the solver. 
    bool    addClause (Lit p, Lit q, Lit r);                    // Add a ternary clause to the solver. 
    bool    addClause (Lit p, Lit q, Lit r, Lit s);
    bool    addClause_(      Minisat::vec<Lit>& ps);   
    //bool    simplify     ();                        // Removes already satisfied clauses.
    bool    solve(const Minisat::vec<Lit>& assumps); // Search for a model that respects a given set of assumptions.
    //lbool   solveLimited (const vec<Lit>& assumps); // Search for a model that respects a given set of assumptions (With resource constraints).
    //bool    solve        ();                        // Search without assumptions.
    bool    solve(Lit p);                   // Search for a model that respects a single assumption.
    //bool    solve        (Lit p, Lit q);            // Search for a model that respects two assumptions.
    //bool    solve        (Lit p, Lit q, Lit r);     // Search for a model that respects three assumptions.
    //bool    okay         () const;                  // FALSE means solver is in a conflicting state
    lbool   modelValue (Var x) const;  
    void    releaseVar(Lit p);
    bool    has(Lit p);
    int     getLit(Lit p);
    int     nVars();

private:
    CaDiCaL::Solver *slv;
    int next_var;

};




}


#endif


