<?php
namespace app\admin\controller;
use think\Config;

class AdvMulti extends Base
{
    protected $languages = [
        'chinese_simplified' => '简体中文',
        'chinese_traditional' => '繁體中文',
        'english' => 'English',
        'japanese' => '日本語',
        'korean' => '한국어',
        'french' => 'Français',
        'spanish' => 'Español',
        'italian' => 'Italiano',
        'deutsch' => 'Deutsch',
        'turkish' => 'Türkçe',
        'russian' => 'Русский',
        'vietnamese' => 'Tiếng Việt',
        'thai' => 'ไทย',
        'khmer' => 'ភាសាខ្មែរ',
        'lao' => 'ພາສາລາວ',
        'malay' => 'Bahasa Melayu',
        'indonesian' => 'Bahasa Indonesia',
        'polish' => 'Polski',
        'dutch' => 'Nederlands',
        'portuguese' => 'Português'
    ];

    public function index()
    {
        if (request()->isPost()) {
            $data = input('post.');
            $config = [];
            
            // Process Banner Ads
            if (isset($data['banner'])) {
                $config['banner'] = $data['banner'];
            } else {
                $config['banner'] = [];
            }

            // Process Player Ads
            if (isset($data['player'])) {
                $config['player'] = $data['player'];
            } else {
                $config['player'] = [];
            }

            // Process Popup
            if (isset($data['popup'])) {
                $config['popup'] = $data['popup'];
            } else {
                $config['popup'] = [];
            }

            $res = mac_arr2file(APP_PATH . 'extra/adv_multi.php', $config);
            if ($res === false) {
                return $this->error('保存失败，请检查文件权限');
            }
            return $this->success('保存成功');
        }

        $config = Config::get('adv_multi');
        $this->assign('config', $config);
        $this->assign('languages', $this->languages);
        return $this->fetch('admin@adv_multi/index');
    }
}
