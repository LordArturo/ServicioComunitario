<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "usuario".
 *
 * @property integer $ID_USER
 * @property string $NOM_USER
 * @property string $APELLIDO
 * @property string $USERNAME
 * @property string $CLAVE
 * @property integer $ROL_COD_ROL
 *
 * @property Rol $rOLCODROL
 */
class Usuario extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
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
            [['NOM_USER', 'APELLIDO', 'USERNAME', 'CLAVE'], 'required'],
            [['ROL_COD_ROL'], 'integer'],
            [['NOM_USER', 'APELLIDO', 'USERNAME', 'CLAVE'], 'string', 'max' => 45],
            [['ROL_COD_ROL'], 'exist', 'skipOnError' => true, 'targetClass' => Rol::className(), 'targetAttribute' => ['ROL_COD_ROL' => 'COD_ROL']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'ID_USER' => 'Id',
            'NOM_USER' => 'Nombre',
            'APELLIDO' => 'Apellido',
            'USERNAME' => 'Username',
            'CLAVE' => 'Clave',
            'ROL_COD_ROL' => 'Rol',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getROLCODROL()
    {
        return $this->hasOne(Rol::className(), ['COD_ROL' => 'ROL_COD_ROL']);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        return self::findOne($id);
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
        
        throw new \yii\base\NotSupportedException();
        
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {

        return self::findOne(['USERNAME'=>$username]);

    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->ID_USER;
    }

    /**
     * @inheritdoc
     */
    public function getUsername()
    {
        return $this->USERNAME;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return $this->ID_USER;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return $this->authKey === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->CLAVE === $password;
    }
}
