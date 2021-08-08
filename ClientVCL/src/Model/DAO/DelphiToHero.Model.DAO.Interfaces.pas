unit DelphiToHero.Model.DAO.Interfaces;

interface

uses
  Data.DB;

type

  iDAOInterface = interface
    ['{E6C4A5D0-D1C4-4AA5-A5A8-30A412D40A32}']
    function Get : iDAOInterface;
    function Post : iDAOInterface;
    function Put : iDAOInterface;
    function Delete : iDAOInterface;
    function DataSource ( aValue : TDataSource ) : iDAOInterface;
    function DataSet : TDataset;
    function AddParam ( aKey : String; aValue : String ) : iDAOInterface;
    function Page : Integer; overload;
    function Page ( aValue : Integer ) : IDAOInterface;  overload;
    function Limit : Integer; overload;
    function Limit ( aValue : Integer ) : IDAOInterface; overload;
    function Total ( aValue : Integer ) : IDAOInterface; overload;
    function Total : Integer; overload;
    function Pages ( aValue : Integer ) : IDAOInterface; overload;
    function Pages : Integer; overload;
  end;

implementation

end.
