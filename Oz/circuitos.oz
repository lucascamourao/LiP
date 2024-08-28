functor
export halfadder: HalfAdder fullsub: Fullsub mux: MUX
import 
    funtor at 'funtorr.ozf'
define 
    proc {HalfAdder A B ?Sum ?Carry}
        C D
    in
        C= {funtor.xorg A B}
        D = {funtor.andg A B}
        Sum=C
        Carry=D
    end

    proc {Fullsub X Y Z ?D ?Bout}
    A B C
    in 
        A = {funtor.xorg X Y} 
        B = {funtor.andg {funtor.notg X} Y}
        C = {funtor.andg Z {funtor.notg A}}
        D = {funtor.xorg Z A}
        Bout = {funtor.org B {funtor.andg  Z {funtor.notg A} }}
    end

    proc {MUX X Y S ?Xout}
        A B 
    in
        A = {funtor.andg {funtor.notg S} X}
        B = {funtor.andg S Y}
        Xout = {funtor.org A B}
    end
end 