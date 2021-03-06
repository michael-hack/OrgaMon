----------------------------------------------------
SQL keywords introduced in different server versions
----------------------------------------------------

An asterisk (*) mark shows that a keyword doesn't exist in the SQL specification
and hence should be considered a non-standard language extention.

Firebird 1.0
------------

  Added as reserved words:

    CURRENT_USER
    CURRENT_ROLE
    BREAK *
    DESCRIPTOR
    FIRST
    RECREATE *
    SKIP *
    SUBSTRING

Firebird 1.5
------------

  Added as reserved words:

    CURRENT_CONNECTION *
    CURRENT_TRANSACTION *
    BIGINT
    CASE
    RELEASE
    ROW_COUNT
    SAVEPOINT

  Added as non-reserved words:

    COALESCE
    DELETING *
    INSERTING *
    LAST
    LEAVE
    LOCK *
    NULLIF
    NULLS
    STATEMENT
    UPDATING *
    USING

  Moved from reserved words to non-reserved:

    BREAK *
    DESCRIPTOR
    FIRST
    SKIP *
    SUBSTRING

Firebird 2.0
------------

  Added as reserved words:

    BIT_LENGTH
    BOTH
    CHAR_LENGTH
    CHARACTER_LENGTH
    CLOSE
    CROSS
    FETCH
    LEADING
    LOWER
    OCTET_LENGTH
    OPEN
    ROWS
    TRAILING
    TRIM

  Moved from non-reserved words to reserved:

    USING

  Added as non-reserved words:

    BACKUP *
    BLOCK *
    COLLATION
    COMMENT *
    DIFFERENCE *
    IIF *
    NEXT
    SCALAR_ARRAY *
    SEQUENCE
    RESTART
    RETURNING *

  Moved from reserved words to non-reserved:

    ACTION
    CASCADE
    FREE_IT *
    RESTRICT
    ROLE
    TYPE
    WEEKDAY *
    YEARDAY *

  Removed reserved words:

    BASENAME *
    CACHE *
    CHECK_POINT_LEN *
    GROUP_COMMIT_WAIT *
    LOGFILE *
    LOG_BUF_SIZE *
    NUM_LOG_BUFS *
    RAW_PARTITIONS *

Firebird 2.1
------------

  Added as reserved words:

    CONNECT
    DISCONNECT
    GLOBAL
    INSENSITIVE
    RECURSIVE
    SENSITIVE
    START

  Added as non-reserved words:

    ABS
    ACCENT *
    ACOS *
    ALWAYS *
    ASCII_CHAR *
    ASCII_VAL *
    ASIN *
    ATAN *
    ATAN2 *
    BIN_AND *
    BIN_OR *
    BIN_SHL *
    BIN_SHR *
    BIN_XOR *
    CEIL
    CEILING
    COS *
    COSH *
    COT *
    DATEADD *
    DATEDIFF *
    DECODE *
    EXP
    FLOOR
    GEN_UUID *
    GENERATED
    HASH *
    LIST *
    LN
    LOG *
    LOG10 *
    LPAD *
    MATCHED
    MATCHING *
    MAXVALUE *
    MILLISECOND *
    MINVALUE *
    MOD
    OVERLAY
    PAD
    PI *
    PLACING
    POWER
    PRESERVE
    RAND *
    REPLACE *
    REVERSE *
    ROUND *
    RPAD *
    SIGN *
    SIN *
    SINH *
    SPACE
    SQRT
    TAN *
    TANH *
    TEMPORARY
    TRUNC *
    WEEK *

Firebird 2.5
------------

  Added as reserved words:

    SIMILAR

  Added as non-reserved words:

    AUTONOMOUS *
    BIN_NOT *
    CALLER *
    CHAR_TO_UUID *
    COMMON *
    DATA
    FIRSTNAME *
    GRANTED
    LASTNAME *
    MIDDLENAME *
    MAPPING *
    OS_NAME *
    SOURCE *
    TWO_PHASE *
    UUID_TO_CHAR *
