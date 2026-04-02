CLASS zcl_teste_eml_mat DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_teste_eml_mat IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    MODIFY ENTITIES OF zc_mat_header
      ENTITY Material

        CREATE FIELDS ( MaterialId Description MaterialType )
        WITH VALUE #( ( %cid         = 'CABECALHO_1'
                        MaterialId   = 'MAT-EML-99'
                        Description  = 'Criado pelo Report ABAP'
                        MaterialType = 'FERT' ) )

        CREATE BY \_Items
        FIELDS ( Posnr Plant Quantity Unit )
        WITH VALUE #( ( %cid_ref = 'CABECALHO_1'
                        %target  = VALUE #(
                          ( %cid = 'ITEM_1' Posnr = '0010' Plant = '1000' Quantity = 10 Unit = 'ST' )
                          ( %cid = 'ITEM_2' Posnr = '0020' Plant = '1000' Quantity = 25 Unit = 'KG' )
                        ) ) )

      MAPPED   DATA(lt_mapped)
      FAILED   DATA(lt_failed)
      REPORTED DATA(lt_reported).

    IF lt_failed IS NOT INITIAL.
      out->write( 'Erro! O material não passou na validação do RAP.' ).
      RETURN.
    ENDIF.

    COMMIT ENTITIES
      RESPONSE OF zc_mat_header
      FAILED     DATA(lt_commit_failed)
      REPORTED   DATA(lt_commit_reported).

    IF lt_commit_failed IS INITIAL.
      out->write( 'Sucesso absoluto! O Material MAT-EML-99 e seus 2 itens foram gravados no banco!' ).
    ELSE.
      out->write( 'Erro ao tentar gravar no banco de dados na hora do COMMIT.' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
