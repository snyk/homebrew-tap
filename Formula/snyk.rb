class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.286.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.286.1/snyk-macos"
    sha256 "20b97773fb5145a8defc46ebdf829a84eb209127cf57697f212293820d050bc7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.286.1/snyk-linux"
    sha256 "3607d1c6bbec35bbc6e66997a6c0472b6c0713721a05b973e71ad275378ea8d2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
