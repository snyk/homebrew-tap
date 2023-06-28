class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1186.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1186.0/snyk-macos"
    sha256 "d565503359ccd94f5596001481fe48b1cc44e7dff0c14fea6d49bcd8c95fbda7"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1186.0/snyk-linux"
    sha256 "74c929d7b0872d7e795447bd78663425e80f911efba1f1d4bc2a944cf98abb49"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
