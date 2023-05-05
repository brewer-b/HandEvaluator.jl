module HandEvaluator

export eval_7c

using DataDeps

register(DataDep("HandRanks",
    """
    Poker hand ranks for the 2+2 LUT
    Notice: this file is over 100MB
    """,
    "https://github.com/christophschmalhofer/poker/raw/master/XPokerEval/XPokerEval.TwoPlusTwo/HandRanks.dat",
    "ad00f3976ad278f2cfd8c47b008cf4dbdefac642d70755a9f20707f8bbeb3c7e"
));

function init_hand_ranks()
    println("Loading HandRanks.dat...")
    hand_ranks = Vector{Int32}(undef, 32487834)
    read!(datadep"HandRanks/HandRanks.dat", hand_ranks)
    println("Complete!")
    return hand_ranks
end

const HR = init_hand_ranks()

function eval_7c(c1, c2, c3, c4, c5, c6, c7)
    p = HR[53 + c1 + 1];
    p = HR[p + c2 + 1];
    p = HR[p + c3 + 1];
    p = HR[p + c4 + 1];
    p = HR[p + c5 + 1];
    p = HR[p + c6 + 1];
   return HR[p + c7 + 1];
end

end