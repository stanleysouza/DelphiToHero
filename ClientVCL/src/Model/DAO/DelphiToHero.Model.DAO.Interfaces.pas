unit DelphiToHero.Model.DAO.Interfaces;

interface

uses
  Data.DB;

type

  iDAOInterface = interface
    ['{064399C5-5AEB-4615-9550-9FD1DD78529F}']
    function Get : iDAOInterface;
    function Post : iDAOInterface;
    function Put : iDAOInterface;
    function Delete : iDAOInterface;
    function DataSource (aValue : TDataSource ) : iDAOInterface;
    function DataSet : TDataset;
  end;

implementation

end.
