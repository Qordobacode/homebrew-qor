class Qor < Formula
  desc "Cli v2 (using Go)"
  homepage "https://github.com/Qordobacode/Cli-v2"
  url "https://github.com/Qordobacode/Cli-v2/archive/v0.7.0.tar.gz"
  sha256 "ead98aea37d4d3171d241f409f645ffaa747049318f48b7c94c476d493467e9e"
  head "https://github.com/Qordobacode/Cli-v2.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    src = buildpath/"src/github.com/qordobacode/cli-v2"
    src.install buildpath.children
    ldflags = %W[
        -s -w
        -X github.com/CircleCI-Public/circleci-cli/cmd.PackageManager=homebrew
        -X github.com/Qordobacode/Cli-v2/version.Version=0.7.0
    ]
    src.cd do
      system "go", "build", "-mod", "vendor", "-ldflags", ldflags.join(" "), "-o", "#{bin}/qor"
      prefix.install_metafiles
    end
  end

  test do
    assert_match "Qordoba Cli v4.0", shell_output("#{bin}/qor --version")
  end
end