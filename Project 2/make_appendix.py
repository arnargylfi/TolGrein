files = [
    'Eulersolver.m',
    'eulerstep.m',
    'part2.m',
    'RKsolver.m',
    'RKstep.m',
    'part3.m',
    'part4.m',
    'part4_plot.m',
    'part5.m',
    'part6.m',
    'part7.m',
    'part8.m',
    'part9.m',

    'Part_8_VO.m',

    'part10plus/part10.m',
    'part10plus/part11_epsilon.m',
    'part10plus/part11_epsilon_multiline.m',
    'part10plus/part11_n.m',
    'part10plus/part11_n_multiline.m',
    'part10plus/RKsolver.m',
    'part10plus/RKstep.m',


    'independent/plotstuff.m',
    'independent/progA.m',
    'independent/progB.m',
    # 'independent/progC.py',
    # 'independent/progC_swarm.py',
    # 'independent/RKsolver.m',
    # 'independent/RKstep.m',

]


for f in files:
    print(r"\lstinputlisting[caption = {" + f.replace('_', '\\_')
          + r"}, label={code:" + f.replace('.m', '').replace('_', '')
          + r"}]{Code/" + f + r"}")
