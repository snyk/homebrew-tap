class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1133.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1133.0/snyk-macos"
    sha256 "0d23c75960caf6b58a0ba6eaaa8dbd83ecad9d13d6ec83f38f27bf26993588de"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1133.0/snyk-linux"
    sha256 "122ce2311fdfca341d86143ae6081f10ac97e5458b3f4e7eb116b5c8e9b245bf"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
