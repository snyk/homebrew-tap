class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.722.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.722.0/snyk-macos"
    sha256 "51520872b20715fd39ff4b0383c59434cd21ab0a4d52a5bb3709bf4ddef42ba0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.722.0/snyk-linux"
    sha256 "29be0441d140cc2d18c30f216c1f7382e422c4461e070e0652705b3d69057b38"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
