module GRL where
import qualified Data.Set as Set
import qualified Data.List as List
import Monad
import System

data Primitive a = Constant a
                 | SignalSource a

data Primitive (a, [Primitive]) = ProcedureApp {procedure::a, sigs::[Primitive]}
                                       | FiniteStateTransducerApp {transducer::a, sigs::[Primitive]}

data Signal 
