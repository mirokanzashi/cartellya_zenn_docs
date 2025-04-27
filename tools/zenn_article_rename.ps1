
# zennのブログファイルのファイル名を重複しないように、
# 指定されたフォルダーパス配下の全ファイルの頭にファイル作成時間を付ける。
# ファイル名の形式は[14桁数字]_自分で決めたファイル名.mdであれば、対象外にする
# ※対象ファイルの拡張子はmdのみ


# 画面の出力のエンコードを UTF-8 に設定する
chcp 65001 > $null
$OutputEncoding = New-Object -typename System.Text.UTF8Encoding

# blogのアカウントID
$accountId = "cartellya"

# 今のpowershellのファイルの絶対パスを取得する
$currentScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path


# $relativeFolder = Read-Host "実行ファイルを基準にして相対パスを入力する"
# ユーザが入力した相対パスを結合する
# $folder = Join-Path -Path $currentScriptPath -ChildPath $relativeFolder

$folder = Join-Path -Path $currentScriptPath -ChildPath "../articles"
# $characters = 'abcdefghijklmnopqrstuvwxyz0123456789'
# フォルダー存在するかを確認する
if (Test-Path -Path $folder -PathType Container) {
    # 特定パターンのファイル名を取得する
    Get-ChildItem -Path $folder -File| Where-Object {
        $_.Name -notmatch "$($accountId)_\d{14}_.*\.md$"
        
    } |ForEach-Object {
      
      # ランダム6桁文字を作成。slugを重複しないように着けたいが、間違ったらリネームする時に全ファイルが新slugになった恐れがあるためやめた。
      # 重複したら手動でファイル名を修正する方がいい
      # $randomString = -join ((1..6) | ForEach-Object { $characters[(Get-Random -Minimum 0 -Maximum $characters.Length)] })

      $oldName = $_.Name
      $creationTime = $_.CreationTime.ToString("yyyyMMddHHmmss") # ファイルの作成時間
      $newNameNotExt= "$($creationTime)_$($_.BaseName)"
      $newName = "$($accountId)_$($creationTime)_$($_.BaseName)$($_.Extension)"
      Rename-Item $_.FullName -NewName $newName  # ファイル名の形式：[blogアカウントID]_[作成時間YYYYMMDDHHmmss]_[定義したファイル名]、ファイル名は50桁を超えないように注意してください
      
      if ($newNameNotExt.Length -gt 50) {
        Write-Host "新ファイル名 $($newName) の長さが50文字に越えた。" -ForegroundColor Red
      } else {
          Write-Host "$($oldName) -> $($newName)"
      }

    }

    Write-Output "処理完了"
} else {
    Write-Output "エラー：フォルダー存在しない"
}
