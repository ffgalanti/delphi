unit Types;

interface

type
  TTypeSection = (secFields,
                  secPrivGetter,
                  secPrivSetter,
                  secProperty,
                  secFncGetter,
                  secPrcSetter
                 );

  TTypeGerar = (tgType,
                tgAsType
               );

  TTypeDriver = (
                  drFirebird,
                  drPostgreSQL
                );

implementation

end.
