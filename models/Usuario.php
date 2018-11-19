<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuario".
 *
 * @property int $id
 * @property int $rol_id
 * @property int $persona_id
 * @property string $nombre_usuario
 * @property string $contrase単a
 * @property int $rol
 * @property int $estado
 * @property string $fecha_registro
 */
class Usuario extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'usuario';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['rol_id', 'persona_id', 'nombre_usuario', 'contrase単a', 'rol', 'estado'], 'required'],
            [['rol_id', 'persona_id', 'rol'], 'integer'],
            [['fecha_registro'], 'safe'],
            [['nombre_usuario', 'contrase単a'], 'string', 'max' => 50],
            [['estado'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'rol_id' => 'Rol ID',
            'persona_id' => 'Persona ID',
            'nombre_usuario' => 'Nombre Usuario',
            'contrase単a' => 'Contrase祓a',
            'rol' => 'Rol',
            'estado' => 'Estado',
            'fecha_registro' => 'Fecha Registro',
        ];
    }
}
