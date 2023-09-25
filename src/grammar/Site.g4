grammar Site;

/**
 * These lines must remain in sync with the `lineMeta` definition found in each of the individual
 * site grammar files.
 */
siteBovada: 'Bovada Hand' '#' INT bovadaFastFold? ('TBL#' | 'ID#') INT bovadaGame bovadaLimit '-' bovadaTimestamp;

/**
 * When new sites are added, include them here as a possible parsing path.
 * (e.g.: `site: siteBovada | siteGG | sitePokerStars`)
 */
site: siteBovada;

// lexer rules for individual sites
bovadaFastFold: 'Zone Poker';
bovadaGame: 'HOLDEM' | 'OMAHA' | 'HOLDEMZonePoker' | 'OMAHAZonePoker';
bovadaLimit: 'No Limit' | 'Pot Limit' | 'Limit';
bovadaTimestamp: INT '-' INT '-' INT INT ':' INT ':' INT;

// lexer rules
INT: [0-9]+;
WS: [ \t]+ -> skip;